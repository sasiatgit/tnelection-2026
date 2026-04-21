const PARTY_COLUMNS = [
  { key: "dmk", label: "DMK+" },
  { key: "admk", label: "ADMK+" },
  { key: "tvk", label: "TVK" },
  { key: "ntk", label: "NTK" },
  { key: "others", label: "Others" }
];

const SOURCE_COLORS = [
  "#0f766e",
  "#2563eb",
  "#ea580c",
  "#9333ea",
  "#0891b2",
  "#b91c1c",
  "#4d7c0f",
  "#334155"
];

export default function SurveyComparison({
  sources,
  selectedSources,
  maxSelections,
  onToggleSource,
  comparisonRows,
  constituencyCount
}) {
  const selectedSet = new Set(selectedSources);
  const maxReached = selectedSources.length >= maxSelections;
  const comparisonMap = Object.fromEntries(
    comparisonRows.map((item) => [item.source, item])
  );

  return (
    <section className="comparisonSection">
      <h3>Survey Comparison (Select 2-3)</h3>
      <div className="comparisonPicker">
        {sources.map((source) => {
          const checked = selectedSet.has(source);
          const disabled = !checked && maxReached;
          return (
            <label key={source} className={`comparisonOption ${disabled ? "disabled" : ""}`}>
              <input
                type="checkbox"
                checked={checked}
                disabled={disabled}
                onChange={() => onToggleSource(source)}
              />
              <span>{source}</span>
            </label>
          );
        })}
      </div>

      <p className="comparisonHint">
        Selected: {selectedSources.length} / {maxSelections} | Constituencies considered:{" "}
        {constituencyCount}
      </p>

      {selectedSources.length >= 2 ? (
        <div className="comparisonGraph">
          {PARTY_COLUMNS.map((party) => (
            <div key={party.key} className="graphRow">
              <div className="graphRowTitle">{party.label}</div>
              <div className="graphBars">
                {selectedSources.map((source, index) => {
                  const value = Number(comparisonMap[source]?.[party.key] ?? 0);
                  return (
                    <div key={`${source}-${party.key}`} className="graphBarItem">
                      <div className="graphBarTop">
                        <span>{source}</span>
                        <strong>{value.toFixed(1)}%</strong>
                      </div>
                      <div className="graphTrack">
                        <div
                          className="graphFill"
                          style={{
                            width: `${value}%`,
                            backgroundColor: SOURCE_COLORS[index % SOURCE_COLORS.length]
                          }}
                        />
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="comparisonHint">Select at least 2 surveys to view comparison details.</p>
      )}
    </section>
  );
}
