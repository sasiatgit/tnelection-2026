import "./globals.css";

export const metadata = {
  title: "All Survey Results in One Place - Tamil Nadu Election 2026",
  description:
    "38 districts, 234 constituencies, and survey results from different sources in one place."
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
