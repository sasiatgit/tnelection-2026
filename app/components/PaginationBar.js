export default function PaginationBar({
  currentPage,
  totalPages,
  pageSize,
  onPrevious,
  onNext
}) {
  return (
    <div className="paginationBar">
      <button
        type="button"
        className="ghost"
        onClick={onPrevious}
        disabled={currentPage === 1}
      >
        Previous
      </button>
      <span>
        Page {currentPage} of {totalPages} ({pageSize} rows per page)
      </span>
      <button
        type="button"
        className="ghost"
        onClick={onNext}
        disabled={currentPage === totalPages}
      >
        Next
      </button>
    </div>
  );
}
