import { TN_CONSTITUENCIES } from "../data/tnConstituencies";

export const makeInitialRows = () =>
  TN_CONSTITUENCIES.map((item) => ({
    no: item.no,
    constituency: item.constituency,
    district: item.district,
    dmk: "",
    admk: "",
    tvk: "",
    ntk: ""
  }));

export const normalizeSavedRows = (rows) =>
  TN_CONSTITUENCIES.map((base, index) => {
    const saved = rows[index] ?? {};
    return {
      no: base.no,
      constituency: base.constituency,
      district: base.district,
      dmk: saved.dmk ?? "",
      admk: saved.admk ?? "",
      tvk: saved.tvk ?? "",
      ntk: saved.ntk ?? ""
    };
  });
