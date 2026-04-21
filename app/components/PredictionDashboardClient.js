"use client";

import { useMemo, useState } from "react";
import DistrictFilters from "./DistrictFilters";
import FilterStatus from "./FilterStatus";
import PaginationBar from "./PaginationBar";
import PredictionTable from "./PredictionTable";
import SourceSelector from "./SourceSelector";
import { DISTRICT_COLORS, PAGE_SIZE } from "../lib/constants";

const MIN_COMPARISON_SELECTIONS = 1;

export default function PredictionDashboardClient({
  initialRows,
  sources,
  winnerPredictions
}) {
  const maxComparisonSelections = sources.length;
  const [currentPage, setCurrentPage] = useState(1);
  const [comparisonSources, setComparisonSources] = useState(() => {
    if (sources.includes("ThanthiTV")) return ["ThanthiTV"];
    return sources.length > 0 ? [sources[0]] : [];
  });
  const [selectedDistricts, setSelectedDistricts] = useState(() => [
    ...new Set(initialRows.map((row) => row.district))
  ]);

  const allDistricts = useMemo(
    () => [...new Set(initialRows.map((row) => row.district))],
    [initialRows]
  );
  const selectedDistrictSet = useMemo(
    () => new Set(selectedDistricts),
    [selectedDistricts]
  );

  const filteredEntries = useMemo(() => {
    return initialRows
      .map((row, index) => ({ row, originalIndex: index }))
      .filter((entry) => selectedDistrictSet.has(entry.row.district));
  }, [initialRows, selectedDistrictSet]);

  const totalPages = Math.max(1, Math.ceil(filteredEntries.length / PAGE_SIZE));
  const startIndex = (currentPage - 1) * PAGE_SIZE;
  const paginatedEntries = filteredEntries.slice(
    startIndex,
    startIndex + PAGE_SIZE
  );

  const districtColorMap = useMemo(() => {
    const uniqueDistricts = [...new Set(initialRows.map((row) => row.district))];
    return Object.fromEntries(
      uniqueDistricts.map((district, index) => [
        district,
        DISTRICT_COLORS[index % DISTRICT_COLORS.length]
      ])
    );
  }, [initialRows]);

  const toggleDistrict = (district) => {
    setSelectedDistricts((prev) => {
      const exists = prev.includes(district);
      if (exists) {
        return prev.filter((item) => item !== district);
      }
      return [...prev, district];
    });
    setCurrentPage(1);
  };

  const selectAllDistricts = () => {
    setSelectedDistricts(allDistricts);
    setCurrentPage(1);
  };

  const clearAllDistricts = () => {
    setSelectedDistricts([]);
    setCurrentPage(1);
  };

  const toggleComparisonSource = (source) => {
    setComparisonSources((prev) => {
      if (prev.includes(source)) {
        if (prev.length <= MIN_COMPARISON_SELECTIONS) {
          return prev;
        }
        return prev.filter((item) => item !== source);
      }
      return [...prev, source];
    });
  };

  return (
    <main className="page">
      <section className="card">
        <div className="topHeader">
          <div className="topLeft">
            <div className="titleBlock">
            <h1>All Constituencies and Survey Results in One Place - Tamil Nadu Election 2026</h1>
            <p>
              38 districts, 234 constituencies, and survey results from
              different sources in one place. These are predictions, and real
              results can always surprise us.
            </p>
            </div>

            <DistrictFilters
              districts={allDistricts}
              selectedDistricts={selectedDistricts}
              onToggleDistrict={toggleDistrict}
              onSelectAll={selectAllDistricts}
              onClearAll={clearAllDistricts}
            />
          </div>

          <aside className="contributeCard">
            <p className="contributeText">
              If you find all details in one place and comparisons useful,
              contribute.
            </p>
            <img
              src="/contribute-upi-qr.png"
              alt="UPI contribution QR code"
              className="contributeQr"
            />
          </aside>
        </div>

        <FilterStatus />

        <SourceSelector
          sources={sources}
          selectedSources={comparisonSources}
          minSelections={MIN_COMPARISON_SELECTIONS}
          maxSelections={maxComparisonSelections}
          onToggleSource={toggleComparisonSource}
        />

        <PredictionTable
          entries={paginatedEntries}
          districtColorMap={districtColorMap}
          selectedSources={comparisonSources}
          winnerPredictions={winnerPredictions}
        />

        <PaginationBar
          currentPage={currentPage}
          totalPages={totalPages}
          pageSize={PAGE_SIZE}
          onPrevious={() => setCurrentPage((prev) => Math.max(1, prev - 1))}
          onNext={() => setCurrentPage((prev) => Math.min(totalPages, prev + 1))}
        />
      </section>
    </main>
  );
}
