import "server-only";
import { Pool } from "pg";

const globalForPg = globalThis;

const pool =
  globalForPg.__tnElectionPool ||
  new Pool({
    host: process.env.PGHOST || "localhost",
    port: Number(process.env.PGPORT || 5432),
    user: process.env.PGUSER || process.env.USER,
    password: process.env.PGPASSWORD || undefined,
    database: process.env.PGDATABASE || "tn_election_2026"
  });

if (process.env.NODE_ENV !== "production") {
  globalForPg.__tnElectionPool = pool;
}

export default pool;
