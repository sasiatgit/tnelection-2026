export const buildCsvContent = (rows, selectedSource, surveyResults) => {
  const header = [
    "No",
    "Constituency",
    "District",
    "Source",
    "DMK+",
    "ADMK+",
    "TVK",
    "NTK",
    "Others"
  ];
  const body = rows.map((row) => [
    row.no,
    row.constituency,
    row.district,
    selectedSource,
    surveyResults[selectedSource]?.[row.no]?.dmk ?? 0,
    surveyResults[selectedSource]?.[row.no]?.admk ?? 0,
    surveyResults[selectedSource]?.[row.no]?.tvk ?? 0,
    surveyResults[selectedSource]?.[row.no]?.ntk ?? 0,
    surveyResults[selectedSource]?.[row.no]?.others ?? 0
  ]);

  return [header, ...body]
    .map((line) =>
      line.map((value) => `"${String(value ?? "").replaceAll('"', '""')}"`).join(",")
    )
    .join("\n");
};
