🎯 What .rdl Files Are

.rdl stands for Report Definition Language — a file format used by Microsoft SQL Server Reporting Services (SSRS).

Business Central reports are essentially built on top of RDLC (Report Definition Language Client-side), which is a variant of .rdl.

.rdl → server-based report (used in SSRS)

.rdlc → client-side report (used in Business Central and Visual Studio Report Designer)

So, in the context of Business Central, you’ll most commonly work with:

.rdlc files (Report Layouts) — but these originate from .rdl schemas.

🧩 Where and How .rdl / .rdlc Are Used in Business Central
1️⃣ In Report Layouts

When you design a report in AL, you usually include an .rdlc layout file.

Example:

report 50120 "Vehicle Type Report"
{
    Caption = 'Vehicle Type Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayouts/VehicleTypeReport.rdlc'; // uses RDLC file
}


That .rdlc file is the visual layout that defines:

Table structure

Grouping

Fonts and styling

Headers/footers

Expressions

💡 You can design this visually in:

Visual Studio

Report Builder (ships with SQL Server / free Microsoft tool)

Business Central Report Builder extension for Visual Studio Code (newer preview)

2️⃣ At Design Time (Developers)

When you design a new report:

You define the dataset in AL (fields, DataItems, etc.)

Then you attach or design a layout (.rdlc) to control how that dataset looks.

Example folder structure:

MyProject/
 ├── ReportLayouts/
 │    ├── VehicleTypeReport.rdlc
 │    └── SalesSummary.rdlc
 ├── src/
 │    ├── Reports/
 │    │    ├── VehicleTypeReport.al
 │    │    └── SalesSummary.al

3️⃣ At Runtime (Users)

When users run a report, Business Central:

Executes the dataset (AL code).

Passes the resulting data to the .rdlc layout.

Renders it (as PDF, Excel, Word, or Preview).

💡 In BC SaaS, reports are rendered using the RDLC rendering engine in the service — not locally.

4️⃣ Optional: Word Layouts

For simpler or user-customizable reports, BC also supports:

DefaultLayout = Word;
WordLayout = 'ReportLayouts/VehicleTypeReport.docx';


These are easier to edit for non-developers, but less powerful.

⚙️ .RDL vs .RDLC – The Difference
Feature	.RDL	.RDLC
Execution	Server-side (SSRS)	Client-side (used in BC)
Data Source	Defined inside report	Provided externally by AL dataset
Typical Use	SQL Server Reporting Services	Business Central, Visual Studio client apps
Editable in	Report Builder / SSRS tools	Visual Studio, Report Builder
Used in BC?	❌ (No direct use)	✅ Yes (official format)

So Business Central uses .rdlc, but technically that’s just a client version of .rdl.

🧭 When You’ll Actually See .rdl in BC

When importing legacy SSRS reports or converting them to RDLC layouts.

When using Report Builder to design reports, it might temporarily save as .rdl (which you then rename or export as .rdlc).

Occasionally, Microsoft sample reports are still labeled .rdl, but they’re 100% compatible with .rdlc.

💡 Quick Summary
Situation	File Type	Used Where
Business Central Report Layout	.rdlc	Inside AL project (RDLCLayout)
SSRS / SQL Server Report	.rdl	SQL Server Reporting Services
Word-based Layout	.docx	Business Central optional layout
Excel Layout (in newer BC)	.xlsx	Optional Excel output template
✅ In Practice

In your Vehicle Types app, you’d only use .rdlc files if you want to:

Create a Vehicle Brand Summary Report or

Print/export vehicle types list in a formatted way.

For example:

report 50120 "Vehicle Brand Report"
{
    Caption = 'Vehicle Brand Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayouts/VehicleBrandReport.rdlc';
}


Would you like me to show you how to create a simple RDLC report that prints the “Vehicle Brands and Models” with grouping (parent → child layout)?
It’s the perfect next step to complete your module with a printable summary.