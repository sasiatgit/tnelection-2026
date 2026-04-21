export default function ActionBar({ onHome, onShowAllDistricts }) {
  return (
    <div className="actions">
      <button type="button" className="ghost" onClick={onHome}>
        Home
      </button>
      <button type="button" className="ghost" onClick={onShowAllDistricts}>
        Want to see specific districts or all districts
      </button>
    </div>
  );
}
