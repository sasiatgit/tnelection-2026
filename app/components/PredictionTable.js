export default function PredictionTable({
  entries,
  districtColorMap,
  selectedSources,
  winnerPredictions
}) {
  const displaySourceName = (source) =>
    source === "Puthiyathalamurai" ? "Puthiyalamurai" : source;

  const getWinnerLabel = (source, no) =>
    winnerPredictions[source]?.[no] ?? "Tough";

  const WinnerSourceCell = () => {
    return (
      <div className="winnerCell">
        {selectedSources.map((source) => (
          <div key={`${source}-name`} className="winnerRow">
            <span className="sourceName">{displaySourceName(source)}</span>
          </div>
        ))}
      </div>
    );
  };

  const WinnerPartyCell = ({ no }) => {
    const showActualForSource = (source) =>
      source === "ThanthiTV" || source === "SathiyamTV";

    const winnerToneClass = (label) => {
      if (label === "DMK+") return "winnerDmk";
      if (label === "ADMK+") return "winnerAdmk";
      if (label === "TVK") return "winnerTvk";
      if (label === "NTK") return "winnerNtk";
      if (label === "Others") return "winnerOthers";
      return "winnerTough";
    };

    return (
      <div className="winnerCell">
        {selectedSources.map((source) => {
          const rawLabel = showActualForSource(source)
            ? getWinnerLabel(source, no)
            : "Tough";
          const label =
            !showActualForSource(source)
              ? "Coming soon"
              : rawLabel === "DMK+"
              ? "DMK Alliance"
              : rawLabel === "ADMK+"
              ? "ADMK Alliance"
              : rawLabel;
          return (
            <div key={`${source}-winner-${no}`} className="winnerRow">
              <span className={`winnerBadge ${winnerToneClass(rawLabel)}`}>
                {label === "Tough" ? "Tough / No clear winner" : label}
              </span>
            </div>
          );
        })}
      </div>
    );
  };

  return (
    <div className="tableWrap">
      <table className="predictionTableEqual">
        <thead>
          <tr>
            <th>No</th>
            <th>Constituency</th>
            <th>District</th>
            <th>Survey Source</th>
            <th>Political Party</th>
          </tr>
        </thead>
        <tbody>
          {entries.map((entry) => (
            <tr
              key={entry.row.no}
              style={{ backgroundColor: districtColorMap[entry.row.district] }}
            >
              <td>{entry.row.no}</td>
              <td>{entry.row.constituency}</td>
              <td>{entry.row.district}</td>
              <td>
                <WinnerSourceCell />
              </td>
              <td>
                <WinnerPartyCell no={entry.row.no} />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
