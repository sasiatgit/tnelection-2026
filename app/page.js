import PredictionDashboardClient from "./components/PredictionDashboardClient";
import { fetchDashboardData } from "./lib/electionRepository.server";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  const { rows, sources, winnerPredictions } = await fetchDashboardData();

  return (
    <PredictionDashboardClient
      initialRows={rows}
      sources={sources}
      winnerPredictions={winnerPredictions}
    />
  );
}
