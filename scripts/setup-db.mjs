import { Pool } from "pg";

const DATABASE = process.env.PGDATABASE || "tn_election_2026";

const pool = new Pool({
  host: process.env.PGHOST || "localhost",
  port: Number(process.env.PGPORT || 5432),
  user: process.env.PGUSER || process.env.USER,
  password: process.env.PGPASSWORD || undefined,
  database: DATABASE
});

const sources = [
  "ThanthiTV",
  "SathiyamTV",
  "VikatanTV",
  "News7",
  "Puthiyathalamurai",
  "News18",
  "News24*7",
  "Chanakya"
];

const gummidipoondiValues = {
  dmk: 35,
  admk: 34,
  tvk: 25,
  ntk: 3,
  others: 3
};

const gummidipoondiWinners = {
  ThanthiTV: "DMK+",
  SathiyamTV: "DMK+",
  VikatanTV: "Tough",
  News7: "Tough",
  Puthiyathalamurai: "DMK+",
  News18: "ADMK+",
  "News24*7": "TVK",
  Chanakya: "TVK"
};

async function run() {
  const client = await pool.connect();
  try {
    await client.query("BEGIN");

    await client.query(`
      CREATE TABLE IF NOT EXISTS constituencies (
        no INTEGER PRIMARY KEY,
        constituency TEXT NOT NULL,
        district TEXT NOT NULL
      );
    `);

    await client.query(`
      CREATE TABLE IF NOT EXISTS survey_sources (
        id SERIAL PRIMARY KEY,
        name TEXT UNIQUE NOT NULL
      );
    `);

    await client.query(`
      CREATE TABLE IF NOT EXISTS survey_results (
        constituency_no INTEGER NOT NULL REFERENCES constituencies(no) ON DELETE CASCADE,
        source_id INTEGER NOT NULL REFERENCES survey_sources(id) ON DELETE CASCADE,
        dmk NUMERIC(5,2) NOT NULL,
        admk NUMERIC(5,2) NOT NULL,
        tvk NUMERIC(5,2) NOT NULL,
        ntk NUMERIC(5,2) NOT NULL,
        others NUMERIC(5,2) NOT NULL DEFAULT 0,
        updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        PRIMARY KEY (constituency_no, source_id)
      );
    `);

    await client.query(`
      CREATE TABLE IF NOT EXISTS survey_winner_predictions (
        constituency_no INTEGER NOT NULL REFERENCES constituencies(no) ON DELETE CASCADE,
        source_id INTEGER NOT NULL REFERENCES survey_sources(id) ON DELETE CASCADE,
        winner_label TEXT NOT NULL,
        updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        PRIMARY KEY (constituency_no, source_id)
      );
    `);

    for (const source of sources) {
      await client.query(
        `
        INSERT INTO survey_sources (name)
        VALUES ($1)
        ON CONFLICT (name) DO NOTHING;
      `,
        [source]
      );
    }

    const { rows } = await client.query(
      `SELECT id, name FROM survey_sources WHERE name = ANY($1::text[])`,
      [sources]
    );

    const sourceByName = Object.fromEntries(rows.map((r) => [r.name, r.id]));
    const constituencyOneExists = await client.query(
      `SELECT 1 FROM constituencies WHERE no = 1 LIMIT 1`
    );

    if (constituencyOneExists.rowCount === 0) {
      await client.query("COMMIT");
      console.log(
        "Database setup complete. Skipped sample survey seed because constituency 1 was not found."
      );
      return;
    }

    for (const source of sources) {
      await client.query(
        `
        INSERT INTO survey_results (constituency_no, source_id, dmk, admk, tvk, ntk, others)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
        ON CONFLICT (constituency_no, source_id)
        DO UPDATE SET
          dmk = EXCLUDED.dmk,
          admk = EXCLUDED.admk,
          tvk = EXCLUDED.tvk,
          ntk = EXCLUDED.ntk,
          others = EXCLUDED.others,
          updated_at = NOW();
      `,
        [
          1,
          sourceByName[source],
          gummidipoondiValues.dmk,
          gummidipoondiValues.admk,
          gummidipoondiValues.tvk,
          gummidipoondiValues.ntk,
          gummidipoondiValues.others
        ]
      );

      await client.query(
        `
        INSERT INTO survey_winner_predictions (constituency_no, source_id, winner_label)
        VALUES ($1, $2, $3)
        ON CONFLICT (constituency_no, source_id)
        DO UPDATE SET
          winner_label = EXCLUDED.winner_label,
          updated_at = NOW();
      `,
        [1, sourceByName[source], gummidipoondiWinners[source] ?? "Tough"]
      );
    }

    await client.query("COMMIT");
    console.log("Database setup complete.");
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
    await pool.end();
  }
}

run().catch((error) => {
  console.error("Failed to setup DB:", error);
  process.exit(1);
});
