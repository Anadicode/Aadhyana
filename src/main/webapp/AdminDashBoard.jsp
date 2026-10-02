<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aadhyana | Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --bg: #eceef2;
    --panel: #ffffff;
    --line: #d5d9e0;
    --line-soft: #e8ebf0;
    --ink: #181c25;
    --muted: #5b6475;
    --accent: #1d4ed8;
    --ok: #16794a;
    --bad: #c4302b;
    --warn: #b7791f;
    --bar: #151a24;
    --mono: "IBM Plex Mono", ui-monospace, Consolas, monospace;
}

* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: "IBM Plex Sans", "Segoe UI", Arial, sans-serif;
    background: var(--bg);
    color: var(--ink);
    font-size: 14px;
    line-height: 1.5;
}

/* ---------- Top bar ---------- */
.topbar {
    height: 48px;
    background: var(--bar);
    color: #e6e9f0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 24px;
    border-bottom: 2px solid var(--accent);
}

.topbar-left { display: flex; align-items: center; gap: 14px; }
.brand { font-weight: 600; font-size: 15px; letter-spacing: 0.01em; color: #fff; }
.crumb { font-size: 13px; color: #8d96a8; }
.crumb b { color: #e6e9f0; font-weight: 500; }

.topbar-right { display: flex; align-items: center; gap: 16px; font-size: 13px; color: #aab2c2; }

.logout-btn {
    text-decoration: none;
    color: #e6e9f0;
    border: 1px solid #3a4355;
    border-radius: 3px;
    padding: 4px 12px;
    font-size: 13px;
}

.logout-btn:hover { background: #232a38; }
.logout-btn:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }

/* ---------- Page ---------- */
main { max-width: 1280px; margin: 0 auto; padding: 24px; }

.page-head { margin-bottom: 18px; }
.page-head h1 { font-size: 22px; font-weight: 600; letter-spacing: -0.01em; }
.page-head p { color: var(--muted); font-size: 13px; }

.box {
    background: var(--panel);
    border: 1px solid var(--line);
    border-radius: 4px;
}

.box-head {
    padding: 11px 16px;
    border-bottom: 1px solid var(--line);
    font-weight: 600;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    align-items: baseline;
}

.box-head span { font-weight: 400; font-size: 12px; color: var(--muted); }

.mono { font-family: var(--mono); font-variant-numeric: tabular-nums; }

/* ---------- Metrics strip ---------- */
.metrics {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    margin-bottom: 16px;
}

.metric { padding: 14px 16px; border-left: 1px solid var(--line); }
.metric:first-child { border-left: none; }

.metric .label { font-size: 12px; color: var(--muted); }
.metric .value { font-family: var(--mono); font-size: 28px; font-weight: 500; line-height: 1.2; margin-top: 2px; }
.metric .note { font-size: 12px; color: var(--muted); }

/* ---------- Two column ---------- */
.cols {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
    margin-bottom: 16px;
}

.body { padding: 16px; }

/* Attendance */
.att-top { display: flex; align-items: baseline; gap: 12px; margin-bottom: 14px; }
.att-top .rate { font-family: var(--mono); font-size: 36px; font-weight: 500; line-height: 1; }
.att-top .sub { color: var(--muted); font-size: 13px; }

.cells { display: grid; grid-template-columns: repeat(9, 1fr); gap: 4px; margin-bottom: 8px; }
.cell { height: 34px; border-radius: 2px; background: var(--ok); }
.cell.absent { background: var(--bad); }

.cells-key { display: flex; gap: 16px; font-size: 12px; color: var(--muted); margin-bottom: 16px; }
.cells-key i { display: inline-block; width: 9px; height: 9px; border-radius: 2px; margin-right: 6px; background: var(--ok); }
.cells-key i.absent { background: var(--bad); }

/* Key-value rows */
.kv { width: 100%; border-collapse: collapse; }
.kv td { padding: 8px 0; border-top: 1px solid var(--line-soft); }
.kv td:last-child { text-align: right; font-family: var(--mono); font-weight: 500; }
.kv td:first-child { color: var(--muted); }

/* Fees */
.fee-top { display: flex; align-items: baseline; justify-content: space-between; margin-bottom: 14px; }
.fee-top .amount { font-family: var(--mono); font-size: 36px; font-weight: 500; line-height: 1; }
.fee-top .of { color: var(--muted); font-size: 13px; }

.stack { display: flex; height: 34px; gap: 2px; margin-bottom: 8px; }
.stack div {
    display: flex;
    align-items: center;
    padding: 0 10px;
    font-family: var(--mono);
    font-size: 12px;
    font-weight: 500;
    color: #fff;
    border-radius: 2px;
}

.stack .paid { width: 75%; background: var(--accent); }
.stack .due { width: 25%; background: var(--warn); }

.cells-key i.paid { background: var(--accent); }
.cells-key i.due { background: var(--warn); }

/* ---------- Modules table ---------- */
.modules { width: 100%; border-collapse: collapse; }

.modules th {
    text-align: left;
    font-weight: 500;
    font-size: 12px;
    color: var(--muted);
    padding: 9px 16px;
    background: #f6f7f9;
    border-bottom: 1px solid var(--line);
}

.modules td { padding: 12px 16px; border-bottom: 1px solid var(--line-soft); vertical-align: top; }
.modules tr:last-child td { border-bottom: none; }
.modules td:first-child { font-weight: 600; white-space: nowrap; }
.modules td:nth-child(2) { color: var(--muted); }
.modules td:last-child { text-align: right; font-family: var(--mono); font-weight: 500; white-space: nowrap; }

/* ---------- Responsive ---------- */
@media (max-width: 960px) {
    .metrics { grid-template-columns: repeat(2, 1fr); }
    .metric { border-left: none; border-top: 1px solid var(--line); }
    .metric:nth-child(-n+2) { border-top: none; }
    .metric:nth-child(even) { border-left: 1px solid var(--line); }
    .cols { grid-template-columns: 1fr; }
}

@media (max-width: 560px) {
    main { padding: 16px 12px; }
    .topbar { padding: 0 12px; }
    .crumb, .who { display: none; }
    .modules th:nth-child(2), .modules td:nth-child(2) { display: none; }
}
</style>
</head>

<body>

<header class="topbar">
    <div class="topbar-left">
        <span class="brand">Aadhyana</span>
        <span class="crumb">Admin / <b>Dashboard</b></span>
    </div>
    <div class="topbar-right">
        <span class="who">Administrator</span>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</header>

<main>

    <div class="page-head">
        <h1>Admin Dashboard</h1>
        <p>Overview of your institute's activities and performance.</p>
    </div>

    <!-- METRICS -->
    <section class="box metrics">
        <div class="metric">
            <div class="label">Total Students</div>
            <div class="value">9</div>
            <div class="note">Registered students</div>
        </div>
        <div class="metric">
            <div class="label">Active Batches</div>
            <div class="value">5</div>
            <div class="note">Currently running</div>
        </div>
        <div class="metric">
            <div class="label">Teachers</div>
            <div class="value">5</div>
            <div class="note">Faculty members</div>
        </div>
        <div class="metric">
            <div class="label">Subjects</div>
            <div class="value">5</div>
            <div class="note">Active subjects</div>
        </div>
        <div class="metric">
            <div class="label">Total Topics</div>
            <div class="value">14</div>
            <div class="note">Across all subjects</div>
        </div>
    </section>

    <!-- ATTENDANCE + FEES -->
    <div class="cols">

        <section class="box">
            <div class="box-head">Today's Attendance <span>Attendance overview</span></div>
            <div class="body">
                <div class="att-top">
                    <div class="rate">78%</div>
                    <div class="sub">present, 7 of 9 students</div>
                </div>

                <div class="cells" role="img" aria-label="7 of 9 students present">
                    <div class="cell"></div><div class="cell"></div><div class="cell"></div>
                    <div class="cell"></div><div class="cell"></div><div class="cell"></div>
                    <div class="cell"></div>
                    <div class="cell absent"></div><div class="cell absent"></div>
                </div>
                <div class="cells-key">
                    <span><i></i>Present</span>
                    <span><i class="absent"></i>Absent</span>
                </div>

                <table class="kv">
                    <tr><td>Total Students</td><td>9</td></tr>
                    <tr><td>Present</td><td>7</td></tr>
                    <tr><td>Absent</td><td>2</td></tr>
                </table>
            </div>
        </section>

        <section class="box">
            <div class="box-head">Fee Overview <span>Current fee collection</span></div>
            <div class="body">
                <div class="fee-top">
                    <div class="amount">₹75,000</div>
                    <div class="of">collected of ₹1,00,000</div>
                </div>

                <div class="stack" role="img" aria-label="75% collected, 25% pending">
                    <div class="paid">75%</div>
                    <div class="due">25%</div>
                </div>
                <div class="cells-key">
                    <span><i class="paid"></i>Collected</span>
                    <span><i class="due"></i>Pending</span>
                </div>

                <table class="kv">
                    <tr><td>Total Fees</td><td>₹1,00,000</td></tr>
                    <tr><td>Collected</td><td>₹75,000</td></tr>
                    <tr><td>Pending</td><td>₹25,000</td></tr>
                </table>
            </div>
        </section>

    </div>

    <!-- MODULES -->
    <section class="box">
        <div class="box-head">Management</div>
        <table class="modules">
            <thead>
                <tr><th>Module</th><th>Description</th><th style="text-align:right">Records</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td>Student Management</td>
                    <td>Manage registered students and their academic information.</td>
                    <td>9 Students</td>
                </tr>
                <tr>
                    <td>Batch Management</td>
                    <td>Monitor active institute batches and assigned teachers.</td>
                    <td>5 Batches</td>
                </tr>
                <tr>
                    <td>Academic Content</td>
                    <td>Manage subjects and topics taught across the institute.</td>
                    <td>14 Topics</td>
                </tr>
            </tbody>
        </table>
    </section>

</main>

</body>
</html>