/* 
 * Risk Exposure - Full Page (Complete Standalone Interface)
 * Contains everything: Nav bar, record header, record tabs, sub-tabs,
 * left panel (premise list), right panel (building detail + coverages)
 * 
 * This is a self-contained demo interface that shows the entire page.
 * Paste into Appian Interface Designer to see the complete layout.
 * 
 * In production, the nav bar and record tabs are platform-provided.
 * This file includes them for demonstration/prototype purposes.
 */

a!localVariables(
  /* ===== DATA ===== */
  local!premises: {
    a!map(id: 1, location: "Location 1", building: "Building 1", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020", constructionType: "Non Combustible", roofingYear: "2018", yearBuilt: "1997"),
    a!map(id: 2, location: "Location 1", building: "Building 2", street: "125 Oxford Street, Westminster", city: "London", state: "England", country: "United Kingdom", zip: "W1D 2HX", constructionType: "Fire Resistive", roofingYear: "2016", yearBuilt: "1993"),
    a!map(id: 3, location: "Location 1", building: "Building 3", street: "350 George Street", city: "Sydney", state: "New South Wales", country: "Australia", zip: "2000", constructionType: "Frame", roofingYear: "2020", yearBuilt: "2001"),
    a!map(id: 4, location: "Location 2", building: "Building 1", street: "742 Lexington Avenue, Manhattan", city: "New York", state: "New York", country: "USA", zip: "10022", constructionType: "Masonry Non Combustible", roofingYear: "2015", yearBuilt: "1990"),
    a!map(id: 5, location: "Location 2", building: "Building 2", street: "18 Orchard Road", city: "Singapore", state: "Singapore", country: "Singapore", zip: "238823", constructionType: "Modified Fire Resistive", roofingYear: "2019", yearBuilt: "1998"),
    a!map(id: 6, location: "Location 2", building: "Building 3", street: "220 Queen Street", city: "Auckland", state: "Auckland", country: "New Zealand", zip: "1010", constructionType: "Joisted Masonry", roofingYear: "2014", yearBuilt: "1989"),
    a!map(id: 7, location: "Location 3", building: "Building 1", street: "8 Anna Salai, Teynampet", city: "Chennai", state: "Tamil Nadu", country: "India", zip: "600018", constructionType: "Fire Resistive", roofingYear: "2013", yearBuilt: "1988"),
    a!map(id: 8, location: "Location 3", building: "Building 2", street: "65 Bahnhofstrasse", city: "Zurich", state: "Zurich", country: "Switzerland", zip: "8001", constructionType: "Modified Fire Resistive", roofingYear: "2022", yearBuilt: "2003")
  },

  local!coverages: {
    a!map(subject: "Building", amount: "$2,500,000", coins: "90%", valuation: "Replacement Cost", cause: "Special Excluding Theft", inflation: "300", ded: "500", blkt: "ASI12", forms: "Special Property Coverage Form with Protective Safeguards endorsement."),
    a!map(subject: "Business Personal Property", amount: "$650,000", coins: "80%", valuation: "Actual Cash Value", cause: "Broad", inflation: "250", ded: "250", blkt: "BPP08", forms: "Business Personal Property coverage subject to inventory reporting requirements."),
    a!map(subject: "Business Income with Extra Expense", amount: "$900,000", coins: "100%", valuation: "Agreed Amount", cause: "Special Excluding Theft", inflation: "200", ded: "500", blkt: "BIE21", forms: "Coverage applies during the period of restoration only."),
    a!map(subject: "Furniture & Fixtures", amount: "$180,000", coins: "90%", valuation: "Replacement Cost", cause: "Basic", inflation: "150", ded: "100", blkt: "FF14", forms: "Replacement limited to like-kind quality and condition.")
  },

  /* State */
  local!selectedPremiseId: 1,
  local!searchText: "",
  local!filterCountry: null,
  local!filterYear: null,
  local!activeSubTab: "riskExposure",
  local!activeRecordTab: "riskDetails",

  /* Derived */
  local!selectedPremise: index(local!premises, wherecontains(local!selectedPremiseId, tointeger(index(local!premises, "id", {}))), a!map()),
  local!uniqueCountries: union(index(local!premises, "country", {}), index(local!premises, "country", {})),
  local!uniqueYears: union(index(local!premises, "yearBuilt", {}), index(local!premises, "yearBuilt", {})),

  local!filteredPremises: a!forEach(
    items: local!premises,
    expression: if(
      and(
        or(isnull(local!searchText), local!searchText = "", search(lower(local!searchText), lower(fv!item.city)), search(lower(local!searchText), lower(fv!item.country)), search(lower(local!searchText), lower(fv!item.location)), search(lower(local!searchText), lower(fv!item.building))),
        or(isnull(local!filterCountry), fv!item.country = local!filterCountry),
        or(isnull(local!filterYear), fv!item.yearBuilt = local!filterYear)
      ),
      fv!item,
      {}
    )
  ),

  /* ===== FULL PAGE LAYOUT ===== */
  {
    /* ===== TOP NAVIGATION BAR ===== */
    a!cardLayout(
      style: "#FFFFFF",
      showBorder: false,
      padding: "EVEN_LESS",
      marginBelow: "NONE",
      contents: {
        a!sideBySideLayout(
          alignVertical: "MIDDLE",
          items: {
            /* Logo */
            a!sideBySideItem(
              width: "MINIMIZE",
              item: a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: a!richTextItem(
                  text: "appian",
                  color: "ACCENT",
                  size: "MEDIUM_PLUS",
                  style: {"STRONG", "EMPHASIS"}
                ),
                marginBelow: "NONE"
              )
            ),
            /* Nav Links */
            a!sideBySideItem(
              item: a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: {
                  a!richTextItem(text: "  MY WORKBENCH  ", size: "SMALL", color: "SECONDARY"),
                  a!richTextItem(text: "  SUBMISSIONS  ", size: "SMALL", style: "STRONG"),
                  a!richTextItem(text: "  PARTIES  ", size: "SMALL", color: "SECONDARY"),
                  a!richTextItem(text: "  MESSAGES  ", size: "SMALL", color: "SECONDARY"),
                  a!richTextItem(text: "  REPORTS  ", size: "SMALL", color: "SECONDARY")
                },
                marginBelow: "NONE"
              )
            ),
            /* Right side */
            a!sideBySideItem(
              width: "MINIMIZE",
              item: a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: {
                  a!richTextItem(text: "Connected Underwriting ", color: "SECONDARY", size: "SMALL"),
                  a!richTextItem(text: " AU ", color: "SECONDARY", size: "SMALL"),
                  a!richTextItem(text: " appian", color: "ACCENT", size: "SMALL", style: {"STRONG", "EMPHASIS"})
                },
                marginBelow: "NONE"
              )
            )
          }
        )
      }
    ),

    /* Divider */
    a!cardLayout(padding: "NONE", marginBelow: "NONE", height: "SHORT", style: "#E0E0E0", showBorder: false),

    /* ===== RECORD HEADER ===== */
    a!cardLayout(
      style: "#FAFAFC",
      showBorder: false,
      padding: "STANDARD",
      marginBelow: "NONE",
      contents: {
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: {
            a!richTextItem(text: "SUB7FBA3A6 | Regent Park Villas", size: "LARGE", style: "STRONG"),
            "  ",
            a!richTextItem(text: "Commercial Property", color: "ACCENT", style: "STRONG")
          },
          marginBelow: "NONE"
        )
      }
    ),

    /* ===== RECORD TABS ===== */
    a!cardLayout(
      showBorder: false,
      padding: "EVEN_LESS",
      marginBelow: "NONE",
      contents: {
        a!buttonArrayLayout(
          buttons: {
            a!buttonWidget(label: "Summary", size: "SMALL", style: "LINK"),
            a!buttonWidget(label: "Submission Docs", size: "SMALL", style: "LINK"),
            a!buttonWidget(label: "Risk Details", size: "SMALL", style: "SOLID"),
            a!buttonWidget(label: "Messages", size: "SMALL", style: "LINK"),
            a!buttonWidget(label: "Sanctions Check", size: "SMALL", style: "LINK"),
            a!buttonWidget(label: "Related Actions", size: "SMALL", style: "LINK")
          },
          marginBelow: "NONE"
        )
      }
    ),

    /* Divider */
    a!cardLayout(padding: "NONE", marginBelow: "NONE", height: "SHORT", style: "#DCDCE5", showBorder: false),

    /* ===== SUB-TAB TOGGLE ===== */
    a!cardLayout(
      showBorder: false,
      padding: "EVEN_LESS",
      marginBelow: "NONE",
      contents: {
        a!buttonArrayLayout(
          buttons: {
            a!buttonWidget(
              label: "Loss History",
              size: "SMALL",
              style: if(local!activeSubTab = "lossHistory", "SOLID", "OUTLINE"),
              color: if(local!activeSubTab = "lossHistory", "ACCENT", "SECONDARY"),
              saveInto: a!save(local!activeSubTab, "lossHistory")
            ),
            a!buttonWidget(
              label: "Risk Exposure",
              size: "SMALL",
              style: if(local!activeSubTab = "riskExposure", "SOLID", "OUTLINE"),
              color: if(local!activeSubTab = "riskExposure", "ACCENT", "SECONDARY"),
              saveInto: a!save(local!activeSubTab, "riskExposure")
            )
          },
          marginBelow: "NONE"
        )
      }
    ),

    /* ===== MAIN CONTENT ===== */
    if(
      local!activeSubTab = "lossHistory",

      /* LOSS HISTORY - Under Progress */
      a!cardLayout(
        padding: "MORE",
        shape: "SEMI_ROUNDED",
        marginAbove: "STANDARD",
        contents: {
          a!stampField(labelPosition: "COLLAPSED", icon: "clock-o", backgroundColor: "#EDEEFA", contentColor: "ACCENT", size: "MEDIUM", align: "CENTER", marginBelow: "STANDARD"),
          a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Under Progress", size: "MEDIUM_PLUS", style: "STRONG", color: "ACCENT"), align: "CENTER", marginBelow: "LESS"),
          a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Loss History module is currently being developed.", color: "SECONDARY"), align: "CENTER")
        }
      ),

      /* RISK EXPOSURE - Split Panel */
      a!columnsLayout(
        columns: {
          /* ===== LEFT PANEL ===== */
          a!columnLayout(
            width: "NARROW_PLUS",
            contents: {
              /* Header */
              a!sideBySideLayout(
                alignVertical: "MIDDLE",
                items: {
                  a!sideBySideItem(
                    item: a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: a!richTextItem(text: "Premises", size: "MEDIUM", style: "STRONG", color: "#878787"),
                      marginBelow: "NONE"
                    )
                  ),
                  a!sideBySideItem(
                    width: "MINIMIZE",
                    item: a!buttonArrayLayout(
                      buttons: a!buttonWidget(label: "Add Premise", icon: "plus-circle", size: "SMALL", style: "SOLID"),
                      marginBelow: "NONE"
                    )
                  )
                },
                marginBelow: "STANDARD"
              ),

              /* Search */
              a!textField(labelPosition: "COLLAPSED", placeholder: "Search premises...", value: local!searchText, saveInto: local!searchText, refreshAfter: "KEYPRESS", marginBelow: "LESS"),

              /* Filters */
              a!columnsLayout(
                columns: {
                  a!columnLayout(contents: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "All Countries", choiceLabels: local!uniqueCountries, choiceValues: local!uniqueCountries, value: local!filterCountry, saveInto: local!filterCountry)),
                  a!columnLayout(contents: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "All Years", choiceLabels: local!uniqueYears, choiceValues: local!uniqueYears, value: local!filterYear, saveInto: local!filterYear))
                },
                spacing: "DENSE",
                marginBelow: "STANDARD"
              ),

              /* Premise Cards */
              a!forEach(
                items: local!filteredPremises,
                expression: a!cardLayout(
                  contents: {
                    a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: fv!item.location & " | " & fv!item.building, style: "STRONG"), marginBelow: "NONE"),
                    a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: fv!item.street & ", " & fv!item.city & ", " & fv!item.state, color: "SECONDARY", size: "SMALL"), marginBelow: "NONE"),
                    a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: fv!item.country & " - " & fv!item.zip, color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")
                  },
                  link: a!dynamicLink(value: fv!item.id, saveInto: local!selectedPremiseId),
                  padding: "STANDARD",
                  shape: "SEMI_ROUNDED",
                  marginBelow: "LESS",
                  borderColor: if(fv!item.id = local!selectedPremiseId, "ACCENT", "#EDEEFA"),
                  accessibilityText: if(fv!item.id = local!selectedPremiseId, "Selected", "")
                )
              )
            }
          ),

          /* ===== RIGHT PANEL ===== */
          a!columnLayout(
            contents: {
              /* Violet Header */
              a!cardLayout(
                style: "#E8E7FF",
                showBorder: false,
                padding: "STANDARD",
                shape: "SEMI_ROUNDED",
                marginBelow: "STANDARD",
                contents: {
                  /* Title + Actions */
                  a!sideBySideLayout(
                    alignVertical: "MIDDLE",
                    items: {
                      a!sideBySideItem(
                        item: {
                          a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!selectedPremise.location & " | " & local!selectedPremise.building, size: "MEDIUM_PLUS", style: "STRONG"), marginBelow: "NONE"),
                          a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!selectedPremise.street & ", " & local!selectedPremise.city & ", " & local!selectedPremise.state & ", " & local!selectedPremise.country & " " & local!selectedPremise.zip, color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")
                        }
                      ),
                      a!sideBySideItem(
                        width: "MINIMIZE",
                        item: a!buttonArrayLayout(
                          buttons: {
                            a!buttonWidget(label: "Delete Premise", icon: "trash-o", size: "SMALL", style: "OUTLINE", color: "SECONDARY"),
                            a!buttonWidget(label: "Edit Premise", icon: "pencil", size: "SMALL", style: "SOLID")
                          },
                          marginBelow: "NONE"
                        )
                      )
                    },
                    marginBelow: "STANDARD"
                  ),

                  /* Info Cards */
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: a!sideBySideLayout(spacing: "DENSE", items: {a!sideBySideItem(width: "MINIMIZE", item: a!stampField(labelPosition: "COLLAPSED", icon: "hard-hat", backgroundColor: "#FFEED3", contentColor: "#D97706", size: "TINY")), a!sideBySideItem(item: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Construction Type", style: "STRONG", size: "SMALL"), marginBelow: "NONE"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!selectedPremise.constructionType, size: "SMALL"), marginBelow: "NONE")})})),
                      a!columnLayout(contents: a!sideBySideLayout(spacing: "DENSE", items: {a!sideBySideItem(width: "MINIMIZE", item: a!stampField(labelPosition: "COLLAPSED", icon: "home", backgroundColor: "#FFEED3", contentColor: "#D97706", size: "TINY")), a!sideBySideItem(item: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Bld. Improvement Roofing Year", style: "STRONG", size: "SMALL"), marginBelow: "NONE"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!selectedPremise.roofingYear, size: "SMALL"), marginBelow: "NONE")})})),
                      a!columnLayout(contents: a!sideBySideLayout(spacing: "DENSE", items: {a!sideBySideItem(width: "MINIMIZE", item: a!stampField(labelPosition: "COLLAPSED", icon: "wrench", backgroundColor: "#FFEED3", contentColor: "#D97706", size: "TINY")), a!sideBySideItem(item: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Year Built", style: "STRONG", size: "SMALL"), marginBelow: "NONE"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!selectedPremise.yearBuilt, size: "SMALL"), marginBelow: "NONE")})}))
                    }
                  )
                }
              ),

              /* Property Coverages Header */
              a!sideBySideLayout(
                alignVertical: "MIDDLE",
                items: {
                  a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Property Coverages", color: "#878787", style: "STRONG"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "plus-circle", caption: "Add Coverage", linkStyle: "STANDALONE", link: a!dynamicLink()), marginBelow: "NONE"))
                },
                marginBelow: "LESS"
              ),

              /* Coverages Table */
              a!gridField(
                labelPosition: "COLLAPSED",
                data: todatasubset(local!coverages, fv!pagingInfo),
                columns: {
                  a!gridColumn(label: "Subject of Insurance", value: fv!row.subject),
                  a!gridColumn(label: "Amount", value: fv!row.amount),
                  a!gridColumn(label: "Coins %", value: fv!row.coins),
                  a!gridColumn(label: "Valuation", value: fv!row.valuation),
                  a!gridColumn(label: "Cause of Loss", value: fv!row.cause),
                  a!gridColumn(label: "Inflation Guard", value: fv!row.inflation),
                  a!gridColumn(label: "DED", value: fv!row.ded),
                  a!gridColumn(label: "BLKT#", value: fv!row.blkt),
                  a!gridColumn(label: "Forms & Conditions", value: fv!row.forms)
                },
                pageSize: 10,
                shadeAlternateRows: false
              )
            }
          )
        },
        spacing: "STANDARD",
        marginAbove: "LESS"
      )
    )
  }
)
