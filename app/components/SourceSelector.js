export default function SourceSelector({
  sources,
  selectedSources,
  minSelections,
  maxSelections,
  onToggleSource
}) {
  const displaySourceName = (source) =>
    source === "Puthiyathalamurai" ? "Puthiyalamurai" : source;

  const selectedSet = new Set(selectedSources);

  return (
    <>
      <div className="sourceSelector">
        {sources.map((source) => {
          const checked = selectedSet.has(source);
          return (
            <label
              key={source}
              className={`sourceOption ${checked ? "active" : ""}`}
            >
              <input
                type="checkbox"
                checked={checked}
                onChange={() => onToggleSource(source)}
              />
              <span>{displaySourceName(source)}</span>
            </label>
          );
        })}
      </div>
      <p className="sourceHint">
        Select surveys for comparison. You can select all surveys if you want.
      </p>
    </>
  );
}
