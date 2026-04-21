import "server-only";
import { Pool } from "pg";

const globalForPg = globalThis;
const connectionString =
  process.env.DATABASE_URL || process.env.POSTGRES_URL || "";
const useSsl =
  process.env.PGSSLMODE !== "disable" &&
  (process.env.NODE_ENV === "production" || Boolean(connectionString));

const poolConfig = connectionString
  ? {
      connectionString,
      ssl: useSsl ? { rejectUnauthorized: false } : undefined
    }
  : {
      host: process.env.PGHOST || "localhost",
      port: Number(process.env.PGPORT || 5432),
      user: process.env.PGUSER || process.env.USER,
      password: process.env.PGPASSWORD || undefined,
      database: process.env.PGDATABASE || "tn_election_2026",
      ssl: useSsl ? { rejectUnauthorized: false } : undefined
    };

const pool =
  globalForPg.__tnElectionPool ||
  new Pool(poolConfig);

if (process.env.NODE_ENV !== "production") {
  globalForPg.__tnElectionPool = pool;
}

export default pool;
