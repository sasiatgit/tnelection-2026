import "server-only";
import pool from "./db.server";

export async function fetchDashboardData() {
  const ALLOWED_SOURCES = [
    "ThanthiTV",
    "SathiyamTV",
    "VikatanTV",
    "Chanakya",
    "News7",
    "News18",
    "News24*7",
    "Puthiyathalamurai",
    "Puthiyalamurai"
  ];

  const sourceResult = await pool.query(
    `SELECT name FROM survey_sources ORDER BY id ASC`
  );
  const sources = sourceResult.rows
    .map((row) => row.name)
    .filter((name) => ALLOWED_SOURCES.includes(name));

  const constituencyResult = await pool.query(
    `
      SELECT no, constituency, district
      FROM constituencies
      ORDER BY no ASC;
    `
  );
  const rows = constituencyResult.rows.map((row) => ({
    no: Number(row.no),
    constituency: row.constituency,
    district: row.district
  }));

  const winnerRows = await pool.query(
    `
      SELECT
        w.constituency_no,
        s.name AS source_name,
        w.winner_label
      FROM survey_winner_predictions w
      JOIN survey_sources s ON s.id = w.source_id
      WHERE s.name = ANY($1::text[])
      ORDER BY w.constituency_no ASC, s.id ASC;
    `,
    [sources]
  );

  const winnerPredictions = {};

  for (const source of sources) {
    winnerPredictions[source] = {};
    for (const row of rows) {
      winnerPredictions[source][row.no] = "Tough";
    }
  }

  for (const row of winnerRows.rows) {
    if (!winnerPredictions[row.source_name]) continue;
    winnerPredictions[row.source_name][Number(row.constituency_no)] =
      row.winner_label;
  }

  return { rows, sources, winnerPredictions };
}
