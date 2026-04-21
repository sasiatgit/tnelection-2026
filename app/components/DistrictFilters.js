export default function DistrictFilters({
  districts,
  selectedDistricts,
  onToggleDistrict,
  onSelectAll,
  onClearAll
}) {
  const selectedSet = new Set(selectedDistricts);

  return (
    <div className="districtFilters">
      <div className="districtFiltersActions">
        <button type="button" className="ghost" onClick={onSelectAll}>
          Select All
        </button>
        <button type="button" className="ghost" onClick={onClearAll}>
          Clear All
        </button>
      </div>
      <div className="districtGrid">
        {districts.map((district) => (
          <label key={district} className="districtOption">
            <input
              type="checkbox"
              checked={selectedSet.has(district)}
              onChange={() => onToggleDistrict(district)}
            />
            <span>{district}</span>
          </label>
        ))}
      </div>
    </div>
  );
}
