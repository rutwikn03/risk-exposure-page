a!localVariables(
  local!vehicles: {
    a!map(id: 1, yearMakeModel: "2024 Ford Transit 250", bodyType: "Van", vin: "1FTBW2CM5RKA48291", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$52,840", coverages: "Liability-BI | Liability-PD | Collision | Comprehensive"),
    a!map(id: 2, yearMakeModel: "2023 Chevy Silverado 2500HD", bodyType: "Truck", vin: "3GCPYFED2NG534812", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$67,295", coverages: "Liability-BI | Collision | Comprehensive | Cargo"),
    a!map(id: 3, yearMakeModel: "2024 Toyota Camry LE", bodyType: "Sedan", vin: "4T1G11AK8RU092456", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$28,855", coverages: "Liability-BI | Liability-PD | Collision"),
    a!map(id: 4, yearMakeModel: "2022 Freightliner Cascadia 126", bodyType: "Semi", vin: "3AKJHHDR4NSLA7834", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$178,500", coverages: "Liability-BI | Liability-PD | Collision | Cargo"),
    a!map(id: 5, yearMakeModel: "2024 Ram ProMaster 3500", bodyType: "Van", vin: "3C6MRVJG8RE182745", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$48,120", coverages: "Liability-BI | Collision | Uninsured"),
    a!map(id: 6, yearMakeModel: "2023 Ford F-150 Lightning", bodyType: "Truck", vin: "1FTVW1EL5NWD43678", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$73,490", coverages: "Liability-BI | Liability-PD | Collision | Comprehensive")
  },
  local!drivers: {
    a!map(id: 1, fullName: "Marcus D. Johnson", sex: "Male", licNum: "3849 2918 8291", stateLic: "TX", renewalText: "2y 4m left", renewalColor: "#117C00", yrsExp: "12", dateHired: "Mar 2019", address: "1847 Elm Creek Dr, Arlington, TX"),
    a!map(id: 2, fullName: "Sarah K. Okonkwo", sex: "Female", licNum: "D723 4567", stateLic: "CA", renewalText: "5m left", renewalColor: "#92400E", yrsExp: "8", dateHired: "Jun 2021", address: "2290 Sunset Blvd, LA, CA"),
    a!map(id: 3, fullName: "Robert A. Chen", sex: "Male", licNum: "C432 1010 98", stateLic: "IL", renewalText: "1y 9m left", renewalColor: "#117C00", yrsExp: "22", dateHired: "Jan 2017", address: "4410 N Ashland Ave, Chicago, IL"),
    a!map(id: 4, fullName: "Diana L. Morales", sex: "Female", licNum: "M893 4782 3", stateLic: "FL", renewalText: "Expired", renewalColor: "#991B1B", yrsExp: "5", dateHired: "Nov 2022", address: "780 Brickell Ave, Miami, FL"),
    a!map(id: 5, fullName: "James T. Whitfield", sex: "Male", licNum: "W293 8554 0", stateLic: "NY", renewalText: "3y 1m left", renewalColor: "#117C00", yrsExp: "15", dateHired: "Apr 2018", address: "312 E 84th St, New York, NY"),
    a!map(id: 6, fullName: "Priya R. Nair", sex: "Female", licNum: "N567 8210 9", stateLic: "TX", renewalText: "8m left", renewalColor: "#92400E", yrsExp: "3", dateHired: "Sep 2023", address: "6701 Forest Ln, Dallas, TX")
  },
  local!activeNav: "vehicles",
  local!activeView: "cards",
  local!activeSubTab: "riskExposure",
  local!vehicleSearch: "",
  local!driverSearch: "",
  local!filterBodyType: null,
  local!filterVState: null,
  local!filterCountry: null,
  local!filterDState: null,
  local!filterExp: null,
  {
    /* Sub-tabs */
    a!cardLayout(
      contents: {
        a!columnsLayout(columns: {
          a!columnLayout(contents: {
            a!cardLayout(contents: {
              a!columnsLayout(columns: {
                a!columnLayout(contents: {a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: "Loss History", align: "CENTER")}, marginBelow: "NONE", style: "#efefef", showBorder: false)}),
                a!columnLayout(contents: {a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Risk Exposure", color: "ACCENT", style: "STRONG"), marginBelow: "NONE", align: "CENTER")}, marginBelow: "NONE", style: "NONE", borderColor: "ACCENT", shape: "SEMI_ROUNDED")})
              }, marginBelow: "NONE", spacing: "DENSE")
            }, marginBelow: "STANDARD", style: "#efefef", showBorder: false, shape: "SEMI_ROUNDED")
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

    /* Main: Left Nav + Right Content */
    a!paneLayout(
      panes: {
        /* LEFT PANE */
        a!pane(
          width: "NARROW",
          padding: "NONE",
          contents: {
            a!cardLayout(
              style: "#FFFFFF", showBorder: false, padding: "STANDARD", marginBelow: "NONE",
              contents: {
                a!cardLayout(
                  contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Vehicle Information", size: "SMALL", color: if(local!activeNav = "vehicles", "ACCENT", "STANDARD"), style: if(local!activeNav = "vehicles", "STRONG", "PLAIN")), marginBelow: "NONE")},
                  link: a!dynamicLink(value: "vehicles", saveInto: local!activeNav),
                  marginBelow: "LESS", style: if(local!activeNav = "vehicles", "#EDF2FF", "#FFFFFF"), showBorder: true, borderColor: if(local!activeNav = "vehicles", "ACCENT", "#FFFFFF"), padding: "STANDARD", shape: "SEMI_ROUNDED"
                ),
                a!cardLayout(
                  contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: "Driver Information", size: "SMALL", color: if(local!activeNav = "drivers", "ACCENT", "STANDARD"), style: if(local!activeNav = "drivers", "STRONG", "PLAIN")), marginBelow: "NONE")},
                  link: a!dynamicLink(value: "drivers", saveInto: local!activeNav),
                  marginBelow: "LESS", style: if(local!activeNav = "drivers", "#EDF2FF", "#FFFFFF"), showBorder: true, borderColor: if(local!activeNav = "drivers", "ACCENT", "#FFFFFF"), padding: "STANDARD", shape: "SEMI_ROUNDED"
                )
              }
            )
          }
        ),

        /* RIGHT PANE */
        a!pane(
          width: "AUTO",
          backgroundColor: "#fafafc",
          padding: "STANDARD",
          contents: {
            /* Heading + View Toggle */
            a!sideBySideLayout(
              alignVertical: "MIDDLE",
              items: {
                a!sideBySideItem(item: a!headingField(text: if(local!activeNav = "vehicles", "Vehicle Information", "Driver Information"), size: "MEDIUM_PLUS", color: "SECONDARY", fontWeight: "BOLD")),
                a!sideBySideItem(item: a!buttonArrayLayout(buttons: {
                  a!buttonWidget(label: "", tooltip: "Cards", saveInto: a!save(local!activeView, "cards"), size: "SMALL", icon: "th-large", style: if(local!activeView = "cards", "SOLID", "OUTLINE")),
                  a!buttonWidget(label: "", tooltip: "Grid", saveInto: a!save(local!activeView, "grid"), size: "SMALL", icon: "bars", style: if(local!activeView = "grid", "SOLID", "OUTLINE"))
                }, marginBelow: "NONE"), width: "MINIMIZE")
              }
            ),

            /* Search + Filters (Vehicle) */
            if(
              local!activeNav = "vehicles",
              a!sideBySideLayout(alignVertical: "MIDDLE", spacing: "STANDARD", items: {
                a!sideBySideItem(width: "AUTO", item: a!textField(labelPosition: "COLLAPSED", placeholder: "Search vehicles...", value: local!vehicleSearch, saveInto: local!vehicleSearch, refreshAfter: "KEYPRESS")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: "Search", size: "SMALL", style: "GHOST"), marginBelow: "NONE")),
                a!sideBySideItem(width: "AUTO", item: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Body Type", choiceLabels: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, choiceValues: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, value: local!filterBodyType, saveInto: local!filterBodyType)),
                a!sideBySideItem(width: "AUTO", item: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterVState, saveInto: local!filterVState)),
                a!sideBySideItem(width: "AUTO", item: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Country", choiceLabels: {"USA","Canada","Mexico"}, choiceValues: {"USA","Canada","Mexico"}, value: local!filterCountry, saveInto: local!filterCountry))
              }, marginBelow: "LESS"),

              /* Search + Filters (Driver) */
              a!sideBySideLayout(alignVertical: "MIDDLE", spacing: "STANDARD", items: {
                a!sideBySideItem(width: "AUTO", item: a!textField(labelPosition: "COLLAPSED", placeholder: "Search drivers...", value: local!driverSearch, saveInto: local!driverSearch, refreshAfter: "KEYPRESS")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: "Search", size: "SMALL", style: "GHOST"), marginBelow: "NONE")),
                a!sideBySideItem(width: "AUTO", item: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "State LIC", choiceLabels: {"TX","CA","IL","FL","NY"}, choiceValues: {"TX","CA","IL","FL","NY"}, value: local!filterDState, saveInto: local!filterDState)),
                a!sideBySideItem(width: "AUTO", item: a!dropdownField(labelPosition: "COLLAPSED", placeholder: "Experience", choiceLabels: {"0-5 yrs","6-10 yrs","11-15 yrs","16-20 yrs","20+ yrs"}, choiceValues: {"0-5","6-10","11-15","16-20","20+"}, value: local!filterExp, saveInto: local!filterExp))
              }, marginBelow: "LESS")
            ),

            /* Add + Edit buttons */
            a!sideBySideLayout(
              alignVertical: "MIDDLE",
              items: {
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: if(local!activeNav = "vehicles", "Add Vehicle", "Add Driver"), size: "SMALL", icon: "plus-circle", style: "SOLID"), marginBelow: "NONE")),
                a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: "", marginBelow: "NONE")),
                a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(buttons: a!buttonWidget(label: if(local!activeNav = "vehicles", "Edit Vehicle Details", "Edit Driver Details"), size: "SMALL", icon: "pencil-square-o", style: "OUTLINE"), marginBelow: "NONE"))
              },
              marginBelow: "STANDARD"
            ),

            /* === CONTENT === */
            if(
              local!activeNav = "vehicles",
              if(
                local!activeView = "cards",
                a!forEach(
                  items: enumerate(ceiling(count(local!vehicles) / 3, 1)),
                  expression: a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!vehicles), a!cardLayout(contents: {a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).yearMakeModel, size: "SMALL", style: "STRONG"), "  ", a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).bodyType, size: "SMALL", color: "#2322F0", style: "STRONG")}, marginBelow: "NONE"))}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).vin, size: "SMALL", style: "STRONG")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "Cost: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).costNew, size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "State: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()).stateLic, size: "SMALL", style: "STRONG")}, marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {})),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!vehicles), a!cardLayout(contents: {a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).yearMakeModel, size: "SMALL", style: "STRONG"), "  ", a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).bodyType, size: "SMALL", color: "#117C00", style: "STRONG")}, marginBelow: "NONE"))}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).vin, size: "SMALL", style: "STRONG")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "Cost: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).costNew, size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "State: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()).stateLic, size: "SMALL", style: "STRONG")}, marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {})),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!vehicles), a!cardLayout(contents: {a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).yearMakeModel, size: "SMALL", style: "STRONG"), "  ", a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).bodyType, size: "SMALL", color: "#636363", style: "STRONG")}, marginBelow: "NONE"))}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).vin, size: "SMALL", style: "STRONG")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "Cost: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).costNew, size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "State: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()).stateLic, size: "SMALL", style: "STRONG")}, marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {}))
                    },
                    marginBelow: "STANDARD", spacing: "STANDARD"
                  )
                ),
                a!gridField(labelPosition: "COLLAPSED", data: local!vehicles, columns: {a!gridColumn(label: "Year, Make, Model", value: fv!row.yearMakeModel), a!gridColumn(label: "Body Type", value: fv!row.bodyType, width: "NARROW"), a!gridColumn(label: "V.I.N", value: fv!row.vin), a!gridColumn(label: "Address", value: fv!row.address), a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"), a!gridColumn(label: "Cost New", value: fv!row.costNew, width: "NARROW")}, pageSize: 100, shadeAlternateRows: false)
              ),

              /* === DRIVERS === */
              if(
                local!activeView = "cards",
                a!forEach(
                  items: enumerate(ceiling(count(local!drivers) / 3, 1)),
                  expression: a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!drivers), a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "user", color: "SECONDARY"), "  ", a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).fullName, size: "SMALL", style: "STRONG"), " ", a!richTextItem(text: "(" & index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).sex & ")", size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LIC: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).licNum, size: "SMALL", style: "STRONG"), a!richTextItem(text: " " & char(183) & " " & index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).stateLic, size: "SMALL")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXP: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).yrsExp & " yrs", size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).renewalText, size: "SMALL", color: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()).renewalColor, style: "STRONG"), marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {})),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!drivers), a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "user", color: "SECONDARY"), "  ", a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).fullName, size: "SMALL", style: "STRONG"), " ", a!richTextItem(text: "(" & index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).sex & ")", size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LIC: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).licNum, size: "SMALL", style: "STRONG"), a!richTextItem(text: " " & char(183) & " " & index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).stateLic, size: "SMALL")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXP: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).yrsExp & " yrs", size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).renewalText, size: "SMALL", color: index(local!drivers, (fv!index - 1) * 3 + 2, a!map()).renewalColor, style: "STRONG"), marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {})),
                      a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!drivers), a!cardLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "user", color: "SECONDARY"), "  ", a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).fullName, size: "SMALL", style: "STRONG"), " ", a!richTextItem(text: "(" & index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).sex & ")", size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).address, size: "SMALL", color: "SECONDARY")}, marginBelow: "LESS"), a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LIC: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).licNum, size: "SMALL", style: "STRONG"), a!richTextItem(text: " " & char(183) & " " & index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).stateLic, size: "SMALL")}, marginBelow: "LESS"), a!sideBySideLayout(items: {a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXP: ", size: "SMALL", color: "SECONDARY"), a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).yrsExp & " yrs", size: "SMALL", style: "STRONG")}, marginBelow: "NONE")), a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).renewalText, size: "SMALL", color: index(local!drivers, (fv!index - 1) * 3 + 3, a!map()).renewalColor, style: "STRONG"), marginBelow: "NONE"))})}, style: "#FFFFFF", showShadow: true, showBorder: false, padding: "STANDARD", shape: "SEMI_ROUNDED"), {}))
                    },
                    marginBelow: "STANDARD", spacing: "STANDARD"
                  )
                ),
                a!gridField(labelPosition: "COLLAPSED", data: local!drivers, columns: {a!gridColumn(label: "Full Name", value: fv!row.fullName), a!gridColumn(label: "Sex", value: fv!row.sex, width: "ICON_PLUS"), a!gridColumn(label: "License #", value: fv!row.licNum), a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"), a!gridColumn(label: "Experience", value: fv!row.yrsExp & " yrs", width: "NARROW"), a!gridColumn(label: "Date Hired", value: fv!row.dateHired, width: "NARROW"), a!gridColumn(label: "Renewal", value: fv!row.renewalText, width: "NARROW")}, pageSize: 100, shadeAlternateRows: false)
              )
            )
          }
        )
      },
      showPaneDividers: true
    )
  }
)
