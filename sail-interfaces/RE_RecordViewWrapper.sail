/* 
 * Risk Exposure - Record View Wrapper
 * This is the full record view interface including:
 *   - Submission header (title + product type)
 *   - Sub-tab toggle (Loss History / Risk Exposure)
 *   - Content area (calls RE_RiskExposureMain or shows placeholder)
 * 
 * NOTE: The top navigation bar (Appian logo, site tabs like MY WORKBENCH,
 * SUBMISSIONS, PARTIES, MESSAGES, REPORTS) and the record tabs (Summary,
 * Workflow, Risk Details, Financial Performance, etc.) are provided by:
 *   - Site configuration (nav tabs)
 *   - Branding configuration (logo, colors)
 *   - Record Type configuration (record header + record tabs)
 * These are NOT coded in SAIL — they're platform-provided.
 * 
 * This interface is placed inside the "Risk Details" record view tab.
 * 
 * Replace:
 *   - local!submissionId → rv!record[recordType!Submission.fields.id]
 *   - local!submissionName → rv!record[recordType!Submission.fields.name]
 *   - local!productType → rv!record[recordType!Submission.fields.productType]
 */

a!localVariables(
  /* Record context - in production comes from rv!record */
  local!submissionId: "SUB7FBA3A6",
  local!submissionName: "Regent Park Villas",
  local!productType: "Commercial Property",

  /* Sub-tab state */
  local!activeTab: "riskExposure",

  a!headerContentLayout(
    header: {},
    contents: {
      /* ===== SUBMISSION HEADER ===== */
      /* NOTE: In most cases this is provided by the record header template.
         Only include this if building a custom record view without the 
         standard record header. */
      a!sideBySideLayout(
        alignVertical: "MIDDLE",
        items: {
          a!sideBySideItem(
            item: a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: local!submissionId & " | " & local!submissionName,
                  size: "LARGE",
                  style: "STRONG"
                ),
                "  ",
                a!richTextItem(
                  text: local!productType,
                  color: "ACCENT",
                  style: "STRONG"
                )
              },
              marginBelow: "NONE"
            )
          )
        },
        marginBelow: "STANDARD"
      ),

      /* ===== SUB-TAB TOGGLE (Loss History / Risk Exposure) ===== */
      a!columnsLayout(
        columns: {
          a!columnLayout(
            width: "NARROW",
            contents: a!buttonArrayLayout(
              buttons: {
                a!buttonWidget(
                  label: "Loss History",
                  size: "SMALL",
                  style: if(local!activeTab = "lossHistory", "SOLID", "OUTLINE"),
                  color: if(local!activeTab = "lossHistory", "ACCENT", "SECONDARY"),
                  saveInto: a!save(local!activeTab, "lossHistory")
                ),
                a!buttonWidget(
                  label: "Risk Exposure",
                  size: "SMALL",
                  style: if(local!activeTab = "riskExposure", "SOLID", "OUTLINE"),
                  color: if(local!activeTab = "riskExposure", "ACCENT", "SECONDARY"),
                  saveInto: a!save(local!activeTab, "riskExposure")
                )
              },
              marginBelow: "STANDARD"
            )
          ),
          a!columnLayout()
        }
      ),

      /* ===== CONTENT AREA ===== */
      choose(
        /* Tab index: 1 = lossHistory, 2 = riskExposure */
        if(local!activeTab = "lossHistory", 1, 2),

        /* Tab 1: Loss History - Under Progress */
        a!cardLayout(
          padding: "MORE",
          shape: "SEMI_ROUNDED",
          borderColor: "#EDEEFA",
          contents: {
            a!stampField(
              labelPosition: "COLLAPSED",
              icon: "clock-o",
              backgroundColor: "#EDEEFA",
              contentColor: "ACCENT",
              size: "MEDIUM",
              align: "CENTER",
              marginBelow: "STANDARD"
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: a!richTextItem(
                text: "Under Progress",
                size: "MEDIUM_PLUS",
                style: "STRONG",
                color: "ACCENT"
              ),
              align: "CENTER",
              marginBelow: "LESS"
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: a!richTextItem(
                text: "Loss History module is currently being developed. Check back soon.",
                color: "SECONDARY"
              ),
              align: "CENTER"
            )
          }
        ),

        /* Tab 2: Risk Exposure - Main Content */
        /* In production, call: rule!RE_RiskExposureMain(submissionId: local!submissionId) */
        /* For now, inline the main split-panel layout: */
        rule!RE_RiskExposureMain()
      )
    },
    backgroundColor: "#FAFAFC"
  )
)

/* 
 * ===================================================================
 * PLATFORM-PROVIDED ELEMENTS (Not coded in SAIL):
 * ===================================================================
 * 
 * 1. TOP NAVIGATION BAR
 *    Configured in: Site Designer → Branding
 *    Contains: Appian logo, site tabs (MY WORKBENCH, SUBMISSIONS, PARTIES, 
 *    MESSAGES, REPORTS), app name ("Connected Underwriting"), user avatar
 *    Colors: Set via Site Branding (Navigation Bar color = Blue 5 #020A50 
 *    or white depending on configuration)
 * 
 * 2. RECORD HEADER
 *    Configured in: Record Type → Views → Header
 *    Contains: Record title ("SUB7FBA3A6 | Regent Park Villas"), 
 *    breadcrumbs, record actions
 *    Uses: a!headerTemplateFull() or a!headerTemplateSimple()
 * 
 * 3. RECORD TABS
 *    Configured in: Record Type → Views
 *    Contains: Summary, Workflow, Risk Details, Financial Performance, 
 *    Quote, Submission Docs, History, Messages, Related Actions
 *    Each tab points to an interface rule
 * 
 * 4. SITE TABS
 *    Configured in: Site Designer → Pages
 *    Contains: MY WORKBENCH, SUBMISSIONS, PARTIES, MESSAGES, REPORTS
 *    Each page points to a record list, report, or interface
 * 
 * ===================================================================
 * WHAT IS CODED IN SAIL (this file + child interfaces):
 * ===================================================================
 * 
 * - Sub-tab toggle (Loss History / Risk Exposure)
 * - Left panel: Premise navigation list
 * - Right panel: Building detail + coverages table
 * - Modals: Add Premise, Edit Premise, Add Coverage, Delete Premise
 * 
 * ===================================================================
 */
