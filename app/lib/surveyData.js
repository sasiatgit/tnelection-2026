export const SURVEY_SOURCES = [
  "ThanthiTV",
  "SathiyamTV",
  "VikatanTV",
  "News7",
  "Puthiyathalamurai",
  "News18",
  "News24*7",
  "Chanakya"
];

const DEFAULT_PARTY_VALUES = {
  dmk: 10,
  admk: 10,
  tvk: 10,
  ntk: 10,
  others: 10
};

export const buildDefaultSurveyResults = (rows) =>
  Object.fromEntries(
    SURVEY_SOURCES.map((source) => [
      source,
      Object.fromEntries(
        rows.map((row) => [
          row.no,
          {
            ...DEFAULT_PARTY_VALUES
          }
        ])
      )
    ])
  );
