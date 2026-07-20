/*
 * Commercial Auto Fleet - Full Page (Idea 3: Dropdown Switch)
 * Single panel with dropdown to toggle between Vehicle Info and Driver Info
 * Cards displayed in a 2-column grid layout
 * 
 * Common elements (sub-tabs) match RE_FullPage.sail pattern.
 * Uses same a!paneLayout approach for consistent scroll behavior.
 */

a!localVariables(
  /* ===== VEHICLE DATA ===== */
  local!vehicles: {
    a!map(id: 1, yearMakeModel: "2024 Ford Transit 250", bodyType: "Van", vin: "1FTBW2CM5RKA48291", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$52,840", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Uninsured Motorist"),
    a!map(id: 2, yearMakeModel: "2023 Chevrolet Silverado 2500HD", bodyType: "Truck", vin: "3GCPYFED2NG534812", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$67,295", coverages: "Liability - BI | Collision | Comprehensive | Cargo Coverage"),
    a!map(id: 3, yearMakeModel: "2024 Toyota Camry LE", bodyType: "Sedan", vin: "4T1G11AK8RU092456", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$28,855", coverages: "Liability - BI | Liability - PD | Collision"),
    a!map(id: 4, yearMakeModel: "2022 Freightliner Cascadia 126", bodyType: "Semi", vin: "3AKJHHDR4NSLA7834", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$178,500", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Cargo Coverage"),
    a!map(id: 5, yearMakeModel: "2024 Ram ProMaster 3500", bodyType: "Van", vin: "3C6MRVJG8RE182745", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$48,120", coverages: "Liability - BI | Collision | Uninsured Motorist"),
    a!map(id: 6, yearMakeModel: "2023 Ford F-150 Lightning", bodyType: "Truck", vin: "1FTVW1EL5NWD43678", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$73,490", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Uninsured Motorist"),
    a!map(id: 7, yearMakeModel: "2024 Mercedes-Benz Sprinter 2500", bodyType: "Van", vin: "W1Y4EBHY0RT102934", address: "55 Water St, New York, NY 10004", stateLic: "NY", costNew: "$61,230", coverages: "Liability - BI | Liability - PD | Comprehensive | Roadside Assistance"),
    a!map(id: 8, yearMakeModel: "2023 Peterbilt 579 Ultraloft", bodyType: "Semi", vin: "2NP3LJHR5PM234561", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$192,000", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Cargo Coverage"),
    a!map(id: 9, yearMakeModel: "2024 Honda CR-V EX", bodyType: "SUV", vin: "7FARS6H59RE004832", address: "3300 NW 72nd Ave, Miami, FL 33122", stateLic: "FL", costNew: "$35,400", coverages: "Liability - BI | Collision"),
    a!map(id: 10, yearMakeModel: "2023 International MV607", bodyType: "Box Truck", vin: "3HAMSAAR8NL210456", address: "1200 Logistics Pkwy, Chicago, IL 60607", stateLic: "IL", costNew: "$89,750", coverages: "Liability - BI | Liability - PD | Collision | Cargo Coverage"),
    a!map(id: 11, yearMakeModel: "2024 Tesla Model 3 Long Range", bodyType: "Sedan", vin: "5YJ3E1EC3RF198234", address: "890 Commerce Way, Los Angeles, CA 90015", stateLic: "CA", costNew: "$47,990", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Uninsured Motorist"),
    a!map(id: 12, yearMakeModel: "2022 Kenworth T680 Next Gen", bodyType: "Semi", vin: "1XKYD49X4NJ432187", address: "4521 Industrial Blvd, Dallas, TX 75207", stateLic: "TX", costNew: "$185,000", coverages: "Liability - BI | Liability - PD | Collision | Comprehensive | Cargo Coverage")
  },

  /* ===== DRIVER DATA ===== */
  local!drivers: {
    a!map(id: 1, fullName: "Marcus D. Johnson", sex: "Male", licNum: "3849 2918 8291", stateLic: "TX", renewalText: "2 yrs 4 mo remaining", renewalColor: "#117C00", yrsExp: "12", dateHired: "Mar 15, 2019", dob: "Sep 14, 1982", maritalStatus: "Married", address: "1847 Elm Creek Dr, Arlington, TX 76011"),
    a!map(id: 2, fullName: "Sarah K. Okonkwo", sex: "Female", licNum: "D723 4567", stateLic: "CA", renewalText: "5 mo remaining", renewalColor: "#92400E", yrsExp: "8", dateHired: "Jun 2, 2021", dob: "Jan 23, 1990", maritalStatus: "Single", address: "2290 Sunset Blvd, Apt 4B, Los Angeles, CA 90026"),
    a!map(id: 3, fullName: "Robert A. Chen", sex: "Male", licNum: "C432 1010 98", stateLic: "IL", renewalText: "1 yr 9 mo remaining", renewalColor: "#117C00", yrsExp: "22", dateHired: "Jan 8, 2017", dob: "May 3, 1974", maritalStatus: "Married", address: "4410 N Ashland Ave, Chicago, IL 60640"),
    a!map(id: 4, fullName: "Diana L. Morales", sex: "Female", licNum: "M893 4782 3", stateLic: "FL", renewalText: "Expired 2 mo ago", renewalColor: "#991B1B", yrsExp: "5", dateHired: "Nov 20, 2022", dob: "Aug 19, 1993", maritalStatus: "Divorced", address: "780 Brickell Ave, Unit 2201, Miami, FL 33131"),
    a!map(id: 5, fullName: "James T. Whitfield", sex: "Male", licNum: "W293 8554 0", stateLic: "NY", renewalText: "3 yrs 1 mo remaining", renewalColor: "#117C00", yrsExp: "15", dateHired: "Apr 12, 2018", dob: "Dec 1, 1979", maritalStatus: "Married", address: "312 E 84th St, Apt 6F, New York, NY 10028"),
    a!map(id: 6, fullName: "Priya R. Nair", sex: "Female", licNum: "N567 8210 9", stateLic: "TX", renewalText: "8 mo remaining", renewalColor: "#92400E", yrsExp: "3", dateHired: "Sep 5, 2023", dob: "Feb 28, 1996", maritalStatus: "Single", address: "6701 Forest Ln, Apt 302, Dallas, TX 75230")
  },

  /* ===== STATE ===== */
  local!activeView: "vehicles",
  local!searchText: "",
  local!activeSubTab: "riskExposure",

  /* ===== LAYOUT ===== */
  {
    /* Sub-tab toggle */
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {
              a!cardLayout(
                contents: {
                  a!columnsLayout(
                    columns: {
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
                    },
                    marginBelow: "NONE", spacing: "DENSE"
                  )
                },
                marginBelow: "STANDARD", style: "#efefef", showBorder: false, shape: "SEMI_ROUNDED"
              )
            }),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {})
          },
          marginBelow: "NONE"
        )
      },
      marginBelow: "NONE", style: "#ffffff", showBorder: false, padding: "NONE"
    ),

    a!horizontalLine(marginBelow: "NONE", color: "#cccccc"),

    /* ===== MAIN CONTENT ===== */
    /* Header: Dropdown + Count + Add Button */
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!dropdownField(
            labelPosition: "COLLAPSED",
            choiceLabels: {"Vehicle Information", "Driver Information"},
            choiceValues: {"vehicles", "drivers"},
            value: local!activeView,
            saveInto: local!activeView
          ),
          width: "MINIMIZE"
        ),
        a!sideBySideItem(
          item: a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: " " & tostring(if(local!activeView = "vehicles", count(local!vehicles), count(local!drivers))) & " ",
              color: "ACCENT",
              style: "STRONG",
              size: "SMALL"
            ),
            marginBelow: "NONE"
          ),
          width: "MINIMIZE"
        ),
        a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: "", marginBelow: "NONE")),
        a!sideBySideItem(
          width: "MINIMIZE",
          item: a!buttonArrayLayout(
            buttons: a!buttonWidget(
              label: if(local!activeView = "vehicles", "Add Vehicle", "Add Driver"),
              icon: "plus",
              size: "SMALL",
              style: "SOLID"
            ),
            marginBelow: "NONE"
          )
        )
      },
      marginAbove: "STANDARD",
      marginBelow: "STANDARD",
      alignVertical: "MIDDLE"
    ),

    /* Search */
    a!textField(
      labelPosition: "COLLAPSED",
      placeholder: if(local!activeView = "vehicles", "Search vehicles...", "Search drivers..."),
      value: local!searchText,
      saveInto: local!searchText,
      refreshAfter: "KEYPRESS",
      marginBelow: "STANDARD"
    ),

    /* ===== VEHICLE CARDS (2 columns) ===== */
    if(
      local!activeView = "vehicles",
      a!forEach(
        items: local!vehicles,
        expression: a!cardLayout(
          contents: {
            /* Row 1: Title + Badge | VIN */
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(text: fv!item.yearMakeModel, style: "STRONG"),
                      "  ",
                      a!richTextItem(text: " " & fv!item.bodyType & " ", color: if(fv!item.bodyType = "Van", "#2322F0", if(fv!item.bodyType = "Truck", "#117C00", if(fv!item.bodyType = "Semi", "#991B1B", if(fv!item.bodyType = "Box Truck", "#92400E", "#636363")))), style: "STRONG", size: "SMALL")
                    },
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {a!richTextItem(text: "VIN: ", color: "SECONDARY", size: "SMALL"), a!richTextItem(text: fv!item.vin, style: "STRONG", size: "SMALL")},
                    marginBelow: "NONE"
                  )
                )
              },
              marginBelow: "LESS"
            ),

            /* Row 2: Address | Cost + State */
            a!sideBySideLayout(
              alignVertical: "TOP",
              items: {
                a!sideBySideItem(
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & fv!item.address, color: "SECONDARY", size: "SMALL")},
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(text: "Cost New: ", color: "SECONDARY", size: "SMALL"),
                      a!richTextItem(text: fv!item.costNew, style: "STRONG", size: "SMALL"),
                      char(10),
                      a!richTextItem(text: "State LIC: ", color: "SECONDARY", size: "SMALL"),
                      a!richTextItem(text: fv!item.stateLic, style: "STRONG", size: "SMALL")
                    },
                    marginBelow: "NONE"
                  )
                )
              },
              marginBelow: "LESS"
            ),

            /* Row 3: Coverages */
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(text: "Coverages  ", color: "SECONDARY", size: "SMALL", style: "STRONG"),
                a!richTextItem(text: fv!item.coverages, size: "SMALL")
              },
              marginBelow: "NONE"
            )
          },
          padding: "STANDARD",
          shape: "SEMI_ROUNDED",
          marginBelow: "LESS",
          showBorder: true,
          borderColor: "#EDEEFA"
        )
      ),

      /* ===== DRIVER CARDS (2 columns, flat - no dropdown) ===== */
      a!forEach(
        items: local!drivers,
        expression: a!cardLayout(
          contents: {
            /* Row 1: Name (Gender) | Experience */
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextIcon(icon: "user", color: "SECONDARY"),
                      "  ",
                      a!richTextItem(text: fv!item.fullName, style: "STRONG"),
                      " ",
                      a!richTextItem(text: "(" & fv!item.sex & ")", color: "SECONDARY", size: "SMALL")
                    },
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {a!richTextItem(text: "EXP: ", color: "SECONDARY", size: "SMALL"), a!richTextItem(text: fv!item.yrsExp & " years", style: "STRONG", size: "SMALL")},
                    marginBelow: "NONE"
                  )
                )
              },
              marginBelow: "LESS"
            ),

            /* Row 2: Address | Hired + DOB */
            a!sideBySideLayout(
              alignVertical: "TOP",
              items: {
                a!sideBySideItem(
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & fv!item.address, color: "SECONDARY", size: "SMALL")},
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  width: "MINIMIZE",
                  item: a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(text: "Date Hired: ", color: "SECONDARY", size: "SMALL"),
                      a!richTextItem(text: fv!item.dateHired, style: "STRONG", size: "SMALL"),
                      char(10),
                      a!richTextItem(text: "DOB: ", color: "SECONDARY", size: "SMALL"),
                      a!richTextItem(text: fv!item.dob, style: "STRONG", size: "SMALL")
                    },
                    marginBelow: "NONE"
                  )
                )
              },
              marginBelow: "LESS"
            ),

            /* Row 3: License + Renewal */
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(text: "License  ", color: "SECONDARY", size: "SMALL", style: "STRONG"),
                a!richTextItem(text: "LIC: " & fv!item.licNum & " " & char(183) & " " & fv!item.stateLic & " " & char(183) & " " & fv!item.maritalStatus & " " & char(183) & " ", size: "SMALL"),
                a!richTextItem(text: "Renewal: " & fv!item.renewalText, color: fv!item.renewalColor, style: "STRONG", size: "SMALL")
              },
              marginBelow: "NONE"
            )
          },
          padding: "STANDARD",
          shape: "SEMI_ROUNDED",
          marginBelow: "LESS",
          showBorder: true,
          borderColor: "#EDEEFA"
        )
      )
    )
  }
)
