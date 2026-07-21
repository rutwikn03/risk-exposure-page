/*
 * Commercial Auto Fleet - Full Page Layout
 * Left nav: Vehicle Information | Driver Information
 * Right pane: Search + Filters + Cards/Grid toggle + content
 * Sub-tabs: Loss History | Risk Exposure
 */
a!localVariables(
  local!activeNav: "vehicles",
  local!activeSubTab: "riskExposure",
  local!activeView: "cards",
  local!searchText: "",
  local!filterBodyType: null,
  local!filterState: null,
  local!filterExp: null,

  {
    /* ===== SUB-TABS ===== */
    a!cardLayout(
      contents: {
        a!columnsLayout(columns: {
          a!columnLayout(contents: {
            a!cardLayout(
              contents: {
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {
                    a!cardLayout(
                      contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: "Loss History", align: "CENTER")},
                      marginBelow: "NONE", style: "#efefef", showBorder: false
                    )
                  }),
                  a!columnLayout(contents: {
                    a!cardLayout(
                      contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Risk Exposure", color: "ACCENT", style: "STRONG"), align: "CENTER", marginBelow: "NONE")},
                      marginBelow: "NONE", style: "NONE", borderColor: "ACCENT", shape: "SEMI_ROUNDED"
                    )
                  })
                }, marginBelow: "NONE", spacing: "DENSE")
              },
              marginBelow: "STANDARD", style: "#efefef", showBorder: false, shape: "SEMI_ROUNDED"
            )
          }),
          a!columnLayout(contents: {}),
          a!columnLayout(contents: {}),
          a!columnLayout(contents: {}),
          a!columnLayout(contents: {})
        }, marginBelow: "NONE")
      },
      marginBelow: "NONE", style: "#ffffff", showBorder: false, padding: "NONE"
    ),

    a!horizontalLine(marginBelow: "NONE", color: "#cccccc"),

    /* ===== MAIN: Left Nav + Right Content ===== */
    a!paneLayout(
      panes: {
        /* LEFT PANE: Navigation */
        a!pane(
          width: "NARROW",
          padding: "NONE",
          contents: {
            a!cardLayout(
              style: "#FFFFFF",
              showBorder: false,
              padding: "STANDARD",
              marginBelow: "NONE",
              contents: {
                /* Vehicle Information nav */
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: a!richTextItem(
                        text: "Vehicle Information",
                        style: if(local!activeNav = "vehicles", "STRONG", "PLAIN"),
                        color: if(local!activeNav = "vehicles", "STANDARD", "SECONDARY")
                      ),
                      marginBelow: "NONE"
                    )
                  },
                  link: a!dynamicLink(value: "vehicles", saveInto: local!activeNav),
                  padding: "STANDARD",
                  marginBelow: "LESS",
                  shape: "SQUARED",
                  style: if(local!activeNav = "vehicles", "#EDF2FF", "#FFFFFF"),
                  showBorder: if(local!activeNav = "vehicles", true, false),
                  borderColor: if(local!activeNav = "vehicles", "ACCENT", "STANDARD")
                ),
                /* Driver Information nav */
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: a!richTextItem(
                        text: "Driver Information",
                        style: if(local!activeNav = "drivers", "STRONG", "PLAIN"),
                        color: if(local!activeNav = "drivers", "STANDARD", "SECONDARY")
                      ),
                      marginBelow: "NONE"
                    )
                  },
                  link: a!dynamicLink(value: "drivers", saveInto: local!activeNav),
                  padding: "STANDARD",
                  marginBelow: "LESS",
                  shape: "SQUARED",
                  style: if(local!activeNav = "drivers", "#EDF2FF", "#FFFFFF"),
                  showBorder: if(local!activeNav = "drivers", true, false),
                  borderColor: if(local!activeNav = "drivers", "ACCENT", "STANDARD")
                )
              }
            )
          }
        ),

        /* RIGHT PANE: Content */
        a!pane(
          width: "AUTO",
          backgroundColor: "#FAFAFC",
          padding: "STANDARD",
          contents: {
            /* Header: Title + Add + Edit + View Toggle */
            a!sideBySideLayout(
              alignVertical: "MIDDLE",
              items: {
                a!sideBySideItem(
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: a!richTextItem(
                      text: if(local!activeNav = "vehicles", "Vehicle Information", "Driver Information"),
                      style: "STRONG",
                      size: "MEDIUM",
                      color: "SECONDARY"
                    ),
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: "", marginBelow: "NONE")),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!buttonArrayLayout(
                    buttons: a!buttonWidget(
                      label: if(local!activeNav = "vehicles", "Add Vehicle", "Add Driver"),
                      icon: "plus",
                      size: "SMALL",
                      style: "SOLID"
                    ),
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!buttonArrayLayout(
                    buttons: a!buttonWidget(
                      label: "Edit Details",
                      icon: "pencil",
                      size: "SMALL",
                      style: "OUTLINE"
                    ),
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!buttonArrayLayout(
                    buttons: {
                      a!buttonWidget(label: "Cards", icon: "th-large", size: "SMALL", style: if(local!activeView = "cards", "SOLID", "OUTLINE"), saveInto: a!save(local!activeView, "cards")),
                      a!buttonWidget(label: "Grid", icon: "bars", size: "SMALL", style: if(local!activeView = "grid", "SOLID", "OUTLINE"), saveInto: a!save(local!activeView, "grid"))
                    },
                    marginBelow: "NONE"
                  )
                )
              },
              marginBelow: "STANDARD"
            ),

            /* Search + Filters */
            a!sideBySideLayout(
              alignVertical: "MIDDLE",
              spacing: "STANDARD",
              items: {
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!textField(
                    labelPosition: "COLLAPSED",
                    placeholder: if(local!activeNav = "vehicles", "Search vehicles...", "Search drivers..."),
                    value: local!searchText,
                    saveInto: local!searchText,
                    refreshAfter: "KEYPRESS"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: if(
                    local!activeNav = "vehicles",
                    a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Body Type", choiceLabels: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, choiceValues: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, value: local!filterBodyType, saveInto: local!filterBodyType),
                    a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterState, saveInto: local!filterState)
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: if(
                    local!activeNav = "vehicles",
                    a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterState, saveInto: local!filterState),
                    a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Experience", choiceLabels: {"0-5 yrs","6-10 yrs","11-15 yrs","16-20 yrs","20+ yrs"}, choiceValues: {"0-5","6-10","11-15","16-20","20+"}, value: local!filterExp, saveInto: local!filterExp)
                  )
                )
              },
              marginBelow: "STANDARD"
            ),

            /* Content placeholder - cards or grid loaded here */
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: a!richTextItem(
                text: "/* Cards/Grid content rendered via rule reference: rule!CA_VehicleCards or rule!CA_VehicleGrid etc. */",
                color: "SECONDARY",
                size: "SMALL"
              )
            )
          }
        )
      },
      showPaneDividers: true
    )
  }
)
