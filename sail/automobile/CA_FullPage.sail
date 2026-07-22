/*
 * Commercial Auto Fleet - Complete Full Page
 * Self-contained: all data, cards, grid, filters, navigation
 * Left nav: Vehicle Information | Driver Information (blue left bar active)
 * Right pane: Title + Add/Edit + Cards/Grid toggle | Search + Filters | Cards or Grid content
 */
a!localVariables(
  /* ===== VEHICLE DATA (24 vehicles) ===== */
  local!vehicles: {
    a!map(id: 1, yearMakeModel: "2024 Ford Transit 250", bodyType: "Van", vin: "1FTBW2CM5RKA48291", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$52,840", coverages: "Liability-BI, Liability-PD, Collision, Comprehensive"),
    a!map(id: 2, yearMakeModel: "2023 Chevy Silverado 2500HD", bodyType: "Truck", vin: "3GCPYFED2NG534812", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$67,295", coverages: "Liability-BI, Collision, Comprehensive, Cargo"),
    a!map(id: 3, yearMakeModel: "2024 Toyota Camry LE", bodyType: "Sedan", vin: "4T1G11AK8RU092456", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$28,855", coverages: "Liability-BI, Liability-PD, Collision"),
    a!map(id: 4, yearMakeModel: "2022 Freightliner Cascadia 126", bodyType: "Semi", vin: "3AKJHHDR4NSLA7834", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$178,500", coverages: "Liability-BI, Liability-PD, Collision, Cargo"),
    a!map(id: 5, yearMakeModel: "2024 Ram ProMaster 3500", bodyType: "Van", vin: "3C6MRVJG8RE182745", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$48,120", coverages: "Liability-BI, Collision, Uninsured"),
    a!map(id: 6, yearMakeModel: "2023 Ford F-150 Lightning", bodyType: "Truck", vin: "1FTVW1EL5NWD43678", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$73,490", coverages: "Liability-BI, Liability-PD, Collision, Comprehensive"),
    a!map(id: 7, yearMakeModel: "2024 Mercedes Sprinter 2500", bodyType: "Van", vin: "W1Y4KBHY3RT012345", address: "7820 Peachtree Rd, Atlanta, GA 30309", stateLic: "GA", costNew: "$58,900", coverages: "Liability-BI, Comprehensive, Cargo"),
    a!map(id: 8, yearMakeModel: "2023 Peterbilt 579", bodyType: "Semi", vin: "1XPBD49X3ND567890", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$195,000", coverages: "Liability-BI, Liability-PD, Cargo, Collision"),
    a!map(id: 9, yearMakeModel: "2024 Honda CR-V EX", bodyType: "SUV", vin: "7FARW2H5XRE123456", address: "2100 Main St, Houston, TX 77002", stateLic: "TX", costNew: "$34,750", coverages: "Liability-BI, Collision, Comprehensive"),
    a!map(id: 10, yearMakeModel: "2023 Isuzu NPR HD", bodyType: "Box Truck", vin: "JALB4W163R7890123", address: "500 Distribution Dr, Phoenix, AZ 85034", stateLic: "AZ", costNew: "$62,400", coverages: "Liability-BI, Liability-PD, Cargo"),
    a!map(id: 11, yearMakeModel: "2024 Chevy Express 3500", bodyType: "Van", vin: "1GCWGBFG5R1234567", address: "9100 SW 40th St, Miami, FL 33165", stateLic: "FL", costNew: "$44,200", coverages: "Liability-BI, Collision, Uninsured"),
    a!map(id: 12, yearMakeModel: "2022 Kenworth T680", bodyType: "Semi", vin: "1XKYD49X7NJ098765", address: "3400 Trucking Ln, Memphis, TN 38118", stateLic: "TN", costNew: "$185,600", coverages: "Liability-BI, Liability-PD, Collision, Cargo, Comprehensive")
  },

  /* ===== DRIVER DATA (12 drivers) ===== */
  local!drivers: {
    a!map(id: 1, fullName: "Marcus D. Johnson", sex: "Male", licNum: "3849 2918 8291", stateLic: "TX", licYear: "2023", yrsExp: "12", dateHired: "Mar 2019", dob: "1987-04-12", maritalStatus: "Married", address: "1847 Elm Creek Dr, Arlington, TX"),
    a!map(id: 2, fullName: "Sarah K. Okonkwo", sex: "Female", licNum: "D723 4567", stateLic: "CA", licYear: "2022", yrsExp: "8", dateHired: "Jun 2021", dob: "1992-08-23", maritalStatus: "Single", address: "2290 Sunset Blvd, LA, CA"),
    a!map(id: 3, fullName: "Robert A. Chen", sex: "Male", licNum: "C432 1010 98", stateLic: "IL", licYear: "2023", yrsExp: "22", dateHired: "Jan 2017", dob: "1978-11-05", maritalStatus: "Married", address: "4410 N Ashland Ave, Chicago, IL"),
    a!map(id: 4, fullName: "Diana L. Morales", sex: "Female", licNum: "M893 4782 3", stateLic: "FL", licYear: "2020", yrsExp: "5", dateHired: "Nov 2022", dob: "1995-02-18", maritalStatus: "Single", address: "780 Brickell Ave, Miami, FL"),
    a!map(id: 5, fullName: "James T. Whitfield", sex: "Male", licNum: "W293 8554 0", stateLic: "NY", licYear: "2024", yrsExp: "15", dateHired: "Apr 2018", dob: "1983-06-30", maritalStatus: "Married", address: "312 E 84th St, New York, NY"),
    a!map(id: 6, fullName: "Priya R. Nair", sex: "Female", licNum: "N567 8210 9", stateLic: "TX", licYear: "2022", yrsExp: "3", dateHired: "Sep 2023", dob: "1997-09-14", maritalStatus: "Single", address: "6701 Forest Ln, Dallas, TX"),
    a!map(id: 7, fullName: "Anthony B. Rivera", sex: "Male", licNum: "R234 5678 1", stateLic: "GA", licYear: "2023", yrsExp: "9", dateHired: "Feb 2020", dob: "1990-01-22", maritalStatus: "Married", address: "3420 Peachtree Rd NE, Atlanta, GA"),
    a!map(id: 8, fullName: "Michelle K. Thompson", sex: "Female", licNum: "T891 2345 6", stateLic: "TX", licYear: "2024", yrsExp: "18", dateHired: "Aug 2016", dob: "1980-07-09", maritalStatus: "Divorced", address: "5500 Preston Rd, Dallas, TX"),
    a!map(id: 9, fullName: "David W. Park", sex: "Male", licNum: "P456 7890 2", stateLic: "CA", licYear: "2021", yrsExp: "6", dateHired: "Jan 2022", dob: "1993-12-03", maritalStatus: "Single", address: "1800 Ocean Ave, Santa Monica, CA"),
    a!map(id: 10, fullName: "Lisa M. O'Brien", sex: "Female", licNum: "O123 4567 8", stateLic: "IL", licYear: "2020", yrsExp: "2", dateHired: "Mar 2024", dob: "1999-05-27", maritalStatus: "Single", address: "2200 W Division St, Chicago, IL"),
    a!map(id: 11, fullName: "Carlos E. Gutierrez", sex: "Male", licNum: "G678 9012 3", stateLic: "FL", licYear: "2024", yrsExp: "25", dateHired: "Jun 2014", dob: "1975-03-16", maritalStatus: "Married", address: "900 Biscayne Blvd, Miami, FL"),
    a!map(id: 12, fullName: "Jennifer A. Walsh", sex: "Female", licNum: "W345 6789 0", stateLic: "NY", licYear: "2023", yrsExp: "11", dateHired: "Oct 2019", dob: "1988-10-08", maritalStatus: "Married", address: "450 W 33rd St, New York, NY")
  },

  /* ===== STATE ===== */
  local!activeNav: "vehicles",
  local!activeSubTab: "riskExposure",
  local!activeView: "cards",
  local!searchText: "",
  local!filterBodyType: null,
  local!filterState: null,
  local!filterExp: null,
  local!currentYear: year(today()),

  {
    /* ===== SUB-TABS: Loss History | Risk Exposure ===== */
    a!cardLayout(
      contents: {
        a!columnsLayout(columns: {
          a!columnLayout(contents: {
            a!cardLayout(
              contents: {
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {
                    a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: "Loss History", align: "CENTER")}, marginBelow: "NONE", style: "#efefef", showBorder: false)
                  }),
                  a!columnLayout(contents: {
                    a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Risk Exposure", color: "ACCENT", style: "STRONG"), align: "CENTER", marginBelow: "NONE")}, marginBelow: "NONE", style: "NONE", borderColor: "ACCENT", shape: "SEMI_ROUNDED")
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

    /* ===== MAIN LAYOUT: Left Nav + Right Content ===== */
    a!paneLayout(
      panes: {
        /* ===== LEFT PANE: Text nav with blue left bar ===== */
        a!pane(
          width: "NARROW",
          padding: "NONE",
          contents: {
            a!cardLayout(
              style: "#FFFFFF", showBorder: false, padding: "STANDARD", marginBelow: "NONE",
              contents: {
                /* Vehicle Information */
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Vehicle Information", style: if(local!activeNav = "vehicles", "STRONG", "PLAIN"), color: if(local!activeNav = "vehicles", "STANDARD", "SECONDARY")), marginBelow: "NONE")
                  },
                  link: a!dynamicLink(value: "vehicles", saveInto: local!activeNav),
                  padding: "STANDARD", marginBelow: "LESS", shape: "SQUARED",
                  style: if(local!activeNav = "vehicles", "#EDF2FF", "#FFFFFF"),
                  showBorder: if(local!activeNav = "vehicles", true, false),
                  borderColor: if(local!activeNav = "vehicles", "ACCENT", "STANDARD")
                ),
                /* Driver Information */
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Driver Information", style: if(local!activeNav = "drivers", "STRONG", "PLAIN"), color: if(local!activeNav = "drivers", "STANDARD", "SECONDARY")), marginBelow: "NONE")
                  },
                  link: a!dynamicLink(value: "drivers", saveInto: local!activeNav),
                  padding: "STANDARD", marginBelow: "LESS", shape: "SQUARED",
                  style: if(local!activeNav = "drivers", "#EDF2FF", "#FFFFFF"),
                  showBorder: if(local!activeNav = "drivers", true, false),
                  borderColor: if(local!activeNav = "drivers", "ACCENT", "STANDARD")
                )
              }
            )
          }
        ),

        /* ===== RIGHT PANE: Content ===== */
        a!pane(
          width: "AUTO",
          backgroundColor: "#FAFAFC",
          padding: "STANDARD",
          contents: {
            /* Header: Title + Add + Edit + Cards/Grid */
            a!sideBySideLayout(
              alignVertical: "MIDDLE",
              items: {
                a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: if(local!activeNav = "vehicles", "Vehicle Information", "Driver Information"), style: "STRONG", size: "MEDIUM", color: "SECONDARY"), marginBelow: "NONE")),
                a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: "", marginBelow: "NONE")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: if(local!activeNav = "vehicles", "Add Vehicle", "Add Driver"), icon: "plus", size: "SMALL", style: "SOLID"), marginBelow: "NONE")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: "Edit Details", icon: "pencil", size: "SMALL", style: "OUTLINE"), marginBelow: "NONE")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: {
                  a!buttonWidget(label: "Cards", icon: "th-large", size: "SMALL", style: if(local!activeView = "cards", "SOLID", "OUTLINE"), saveInto: a!save(local!activeView, "cards")),
                  a!buttonWidget(label: "Grid", icon: "bars", size: "SMALL", style: if(local!activeView = "grid", "SOLID", "OUTLINE"), saveInto: a!save(local!activeView, "grid"))
                }, marginBelow: "NONE"))
              },
              marginBelow: "STANDARD"
            ),

            /* Search + Filters inline */
            a!sideBySideLayout(
              alignVertical: "MIDDLE", spacing: "STANDARD",
              items: {
                a!sideBySideItem(width: "MINIMIZE", item: a!textField(labelPosition: "COLLAPSED", placeholder: if(local!activeNav = "vehicles", "Search vehicles...", "Search drivers..."), value: local!searchText, saveInto: local!searchText, refreshAfter: "KEYPRESS")),
                a!sideBySideItem(width: "MINIMIZE", item: if(local!activeNav = "vehicles",
                  a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Body Type", choiceLabels: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, choiceValues: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, value: local!filterBodyType, saveInto: local!filterBodyType),
                  a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterState, saveInto: local!filterState)
                )),
                a!sideBySideItem(width: "MINIMIZE", item: if(local!activeNav = "vehicles",
                  a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterState, saveInto: local!filterState),
                  a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Experience", choiceLabels: {"0-5 yrs","6-10 yrs","11-15 yrs","16-20 yrs","20+ yrs"}, choiceValues: {"0-5","6-10","11-15","16-20","20+"}, value: local!filterExp, saveInto: local!filterExp)
                ))
              },
              marginBelow: "STANDARD"
            ),

            /* ===== CONTENT: VEHICLES ===== */
            if(local!activeNav = "vehicles",
              if(local!activeView = "cards",
                /* VEHICLE CARDS - 3 per row */
                a!forEach(
                  items: enumerate(ceiling(count(local!vehicles) / 3, 1)),
                  expression: a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!vehicles),
                        a!localVariables(local!v: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()),
                          a!cardLayout(contents: {
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      )),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!vehicles),
                        a!localVariables(local!v: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()),
                          a!cardLayout(contents: {
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      )),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!vehicles),
                        a!localVariables(local!v: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()),
                          a!cardLayout(contents: {
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      ))
                    }, spacing: "STANDARD", marginBelow: "LESS"
                  )
                ),
                /* VEHICLE GRID */
                a!gridField(labelPosition: "COLLAPSED", data: local!vehicles, columns: {
                  a!gridColumn(label: "Year, Make, Model", value: fv!row.yearMakeModel),
                  a!gridColumn(label: "Body Type", value: fv!row.bodyType, width: "NARROW"),
                  a!gridColumn(label: "V.I.N", value: fv!row.vin),
                  a!gridColumn(label: "Address", value: fv!row.address),
                  a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"),
                  a!gridColumn(label: "Cost New", value: fv!row.costNew, width: "NARROW"),
                  a!gridColumn(label: "Coverages", value: fv!row.coverages)
                }, pageSize: 100)
              ),

              /* ===== CONTENT: DRIVERS ===== */
              if(local!activeView = "cards",
                /* DRIVER CARDS - 3 per row */
                a!forEach(
                  items: enumerate(ceiling(count(local!drivers) / 3, 1)),
                  expression: a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!drivers),
                        a!localVariables(
                          local!d: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()),
                          local!yearsLeft: (tointeger(local!d.licYear) + 5) - local!currentYear,
                          local!renewalText: if(local!yearsLeft < 0, "Expired", if(local!yearsLeft = 0, "Expires this yr", if(local!yearsLeft = 1, "1 yr left", tostring(local!yearsLeft) & " yrs left"))),
                          local!renewalColor: if(local!yearsLeft < 1, "#991B1B", if(local!yearsLeft = 1, "#92400E", "#117C00")),
                          a!cardLayout(contents: {
                            /* Name + Sex + Menu */
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!d.fullName, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!d.sex & " ", color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            /* Address */
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!d.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            /* License # | State | Experience */
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LICENSE #", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licNum, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXPERIENCE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.yrsExp & " yrs", style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            /* DOB | Hired | Yr LIC / Renewal */
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "DOB", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dob, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "HIRED", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dateHired, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "YR LIC / RENEWAL", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licYear & " · " & local!renewalText, color: local!renewalColor, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "NONE", spacing: "DENSE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      )),
                      /* Columns 2 & 3 follow same pattern */
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!drivers),
                        a!localVariables(
                          local!d: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()),
                          local!yearsLeft: (tointeger(local!d.licYear) + 5) - local!currentYear,
                          local!renewalText: if(local!yearsLeft < 0, "Expired", if(local!yearsLeft = 0, "Expires this yr", if(local!yearsLeft = 1, "1 yr left", tostring(local!yearsLeft) & " yrs left"))),
                          local!renewalColor: if(local!yearsLeft < 1, "#991B1B", if(local!yearsLeft = 1, "#92400E", "#117C00")),
                          a!cardLayout(contents: {
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!d.fullName, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!d.sex & " ", color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!d.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LICENSE #", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licNum, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXPERIENCE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.yrsExp & " yrs", style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "DOB", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dob, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "HIRED", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dateHired, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "YR LIC / RENEWAL", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licYear & " · " & local!renewalText, color: local!renewalColor, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "NONE", spacing: "DENSE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      )),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!drivers),
                        a!localVariables(
                          local!d: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()),
                          local!yearsLeft: (tointeger(local!d.licYear) + 5) - local!currentYear,
                          local!renewalText: if(local!yearsLeft < 0, "Expired", if(local!yearsLeft = 0, "Expires this yr", if(local!yearsLeft = 1, "1 yr left", tostring(local!yearsLeft) & " yrs left"))),
                          local!renewalColor: if(local!yearsLeft < 1, "#991B1B", if(local!yearsLeft = 1, "#92400E", "#117C00")),
                          a!cardLayout(contents: {
                            a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                              a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!d.fullName, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!d.sex & " ", color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")),
                              a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY"), marginBelow: "NONE"))
                            }, marginBelow: "LESS"),
                            a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!d.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                            a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LICENSE #", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licNum, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXPERIENCE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.yrsExp & " yrs", style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "LESS", spacing: "DENSE"),
                            a!columnsLayout(columns: {
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "DOB", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dob, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "HIRED", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dateHired, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                              a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "YR LIC / RENEWAL", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licYear & " · " & local!renewalText, color: local!renewalColor, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                            }, marginBelow: "NONE", spacing: "DENSE")
                          }, padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF")
                        ), {}
                      ))
                    }, spacing: "STANDARD", marginBelow: "LESS"
                  )
                ),
                /* DRIVER GRID */
                a!gridField(labelPosition: "COLLAPSED", data: local!drivers, columns: {
                  a!gridColumn(label: "Full Name", value: fv!row.fullName),
                  a!gridColumn(label: "Sex", value: fv!row.sex, width: "ICON_PLUS"),
                  a!gridColumn(label: "DOB", value: fv!row.dob, width: "NARROW"),
                  a!gridColumn(label: "Marital Status", value: fv!row.maritalStatus, width: "NARROW"),
                  a!gridColumn(label: "License #", value: fv!row.licNum),
                  a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"),
                  a!gridColumn(label: "Experience", value: fv!row.yrsExp & " yrs", width: "NARROW"),
                  a!gridColumn(label: "Date Hired", value: fv!row.dateHired, width: "NARROW"),
                  a!gridColumn(label: "Yr LIC / Renewal", value: a!localVariables(
                    local!yl: (tointeger(fv!row.licYear) + 5) - local!currentYear,
                    fv!row.licYear & " · " & if(local!yl < 0, "Expired", if(local!yl = 0, "Expires this yr", if(local!yl = 1, "1 yr left", tostring(local!yl) & " yrs left")))
                  ))
                }, pageSize: 100)
              )
            )
          }
        )
      },
      showPaneDividers: true
    )
  }
)
