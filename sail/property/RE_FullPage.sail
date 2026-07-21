a!localVariables(
  local!premises: {
    a!map(id: 1, location: "Location 1", building: "Building 1", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020", constructionType: "Non Combustible", roofingYear: "2018", yearBuilt: "1997"),
    a!map(id: 2, location: "Location 1", building: "Building 2", street: "125 Oxford Street, Westminster", city: "London", state: "England", country: "United Kingdom", zip: "W1D 2HX", constructionType: "Fire Resistive", roofingYear: "2016", yearBuilt: "1993"),
    a!map(id: 3, location: "Location 1", building: "Building 3", street: "350 George Street", city: "Sydney", state: "New South Wales", country: "Australia", zip: "2000", constructionType: "Frame", roofingYear: "2020", yearBuilt: "2001"),
    a!map(id: 4, location: "Location 2", building: "Building 1", street: "742 Lexington Avenue, Manhattan", city: "New York", state: "New York", country: "USA", zip: "10022", constructionType: "Masonry Non Combustible", roofingYear: "2015", yearBuilt: "1990"),
    a!map(id: 5, location: "Location 2", building: "Building 2", street: "18 Orchard Road", city: "Singapore", state: "Singapore", country: "Singapore", zip: "238823", constructionType: "Modified Fire Resistive", roofingYear: "2019", yearBuilt: "1998"),
    a!map(id: 6, location: "Location 2", building: "Building 3", street: "220 Queen Street", city: "Auckland", state: "Auckland", country: "New Zealand", zip: "1010", constructionType: "Joisted Masonry", roofingYear: "2014", yearBuilt: "1989"),
    a!map(id: 7, location: "Location 3", building: "Building 1", street: "8 Anna Salai, Teynampet", city: "Chennai", state: "Tamil Nadu", country: "India", zip: "600018", constructionType: "Fire Resistive", roofingYear: "2013", yearBuilt: "1988"),
    a!map(id: 8, location: "Location 3", building: "Building 2", street: "65 Bahnhofstrasse", city: "Zurich", state: "Zurich", country: "Switzerland", zip: "8001", constructionType: "Modified Fire Resistive", roofingYear: "2022", yearBuilt: "2003"),
    a!map(id: 9, location: "Location 4", building: "Building 1", street: "1600 Pennsylvania Ave NW", city: "Washington", state: "DC", country: "USA", zip: "20500", constructionType: "Fire Resistive", roofingYear: "2010", yearBuilt: "1800"),
    a!map(id: 10, location: "Location 4", building: "Building 2", street: "221B Baker Street", city: "London", state: "England", country: "United Kingdom", zip: "NW1 6XE", constructionType: "Joisted Masonry", roofingYear: "2005", yearBuilt: "1885"),
    a!map(id: 11, location: "Location 5", building: "Building 1", street: "1 Infinite Loop", city: "Cupertino", state: "California", country: "USA", zip: "95014", constructionType: "Non Combustible", roofingYear: "2017", yearBuilt: "1993"),
    a!map(id: 12, location: "Location 5", building: "Building 2", street: "Museumstraat 1", city: "Amsterdam", state: "North Holland", country: "Netherlands", zip: "1071 XX", constructionType: "Frame", roofingYear: "2008", yearBuilt: "1885"),
    a!map(id: 13, location: "Location 6", building: "Building 1", street: "Champ de Mars, 5 Avenue Anatole", city: "Paris", state: "Ile-de-France", country: "France", zip: "75007", constructionType: "Fire Resistive", roofingYear: "2012", yearBuilt: "1889"),
    a!map(id: 14, location: "Location 6", building: "Building 2", street: "Via della Conciliazione", city: "Rome", state: "Lazio", country: "Italy", zip: "00120", constructionType: "Masonry Non Combustible", roofingYear: "2009", yearBuilt: "1626"),
    a!map(id: 15, location: "Location 7", building: "Building 1", street: "Potsdamer Platz 1", city: "Berlin", state: "Berlin", country: "Germany", zip: "10785", constructionType: "Non Combustible", roofingYear: "2021", yearBuilt: "2000"),
    a!map(id: 16, location: "Location 7", building: "Building 2", street: "Shibuya Crossing 2-1", city: "Tokyo", state: "Tokyo", country: "Japan", zip: "150-0002", constructionType: "Fire Resistive", roofingYear: "2019", yearBuilt: "2005"),
    a!map(id: 17, location: "Location 8", building: "Building 1", street: "500 Collins Street", city: "Melbourne", state: "Victoria", country: "Australia", zip: "3000", constructionType: "Modified Fire Resistive", roofingYear: "2016", yearBuilt: "1995"),
    a!map(id: 18, location: "Location 8", building: "Building 2", street: "Avenida Paulista 1578", city: "Sao Paulo", state: "SP", country: "Brazil", zip: "01310-200", constructionType: "Non Combustible", roofingYear: "2018", yearBuilt: "1991"),
    a!map(id: 19, location: "Location 9", building: "Building 1", street: "Burj Khalifa Blvd", city: "Dubai", state: "Dubai", country: "UAE", zip: "00000", constructionType: "Fire Resistive", roofingYear: "2023", yearBuilt: "2010"),
    a!map(id: 20, location: "Location 9", building: "Building 2", street: "Table Mountain Rd", city: "Cape Town", state: "Western Cape", country: "South Africa", zip: "8001", constructionType: "Frame", roofingYear: "2011", yearBuilt: "1987")
  },
  local!coverages: {
    a!map(subject: "Building", amount: "$2,500,000", coins: "90%", valuation: "Replacement Cost", cause: "Special Excluding Theft", inflation: "300", ded: "500", blkt: "ASI12", forms: "Special Property Coverage Form with Protective Safeguards endorsement."),
    a!map(subject: "Business Personal Property", amount: "$650,000", coins: "80%", valuation: "Actual Cash Value", cause: "Broad", inflation: "250", ded: "250", blkt: "BPP08", forms: "Business Personal Property coverage subject to inventory reporting requirements."),
    a!map(subject: "Business Income with Extra Expense", amount: "$900,000", coins: "100%", valuation: "Agreed Amount", cause: "Special Excluding Theft", inflation: "200", ded: "500", blkt: "BIE21", forms: "Coverage applies during the period of restoration only."),
    a!map(subject: "Furniture & Fixtures", amount: "$180,000", coins: "90%", valuation: "Replacement Cost", cause: "Basic", inflation: "150", ded: "100", blkt: "FF14", forms: "Replacement limited to like-kind quality and condition.")
  },
  local!selectedPremiseId: 1,
  local!searchText: "",
  local!filterCountry: null,
  local!filterYear: null,
  local!filterLocation: null,
  local!activeSubTab: "riskExposure",
  local!selectedPremise: index(
    local!premises,
    wherecontains(local!selectedPremiseId, tointeger(index(local!premises, "id", {}))),
    a!map()
  ),
  local!filteredPremises: a!forEach(
    items: local!premises,
    expression: if(
      and(
        or(
          isnull(local!searchText),
          local!searchText = "",
          search(lower(local!searchText), lower(fv!item.city)),
          search(lower(local!searchText), lower(fv!item.country)),
          search(lower(local!searchText), lower(fv!item.location)),
          search(lower(local!searchText), lower(fv!item.building))
        ),
        or(isnull(local!filterCountry), fv!item.country = local!filterCountry),
        or(isnull(local!filterYear), fv!item.yearBuilt = local!filterYear),
        or(isnull(local!filterLocation), fv!item.location = local!filterLocation)
      ),
      fv!item,
      {}
    )
  ),
  {
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(
              contents: {
                a!cardLayout(
                  contents: {
                    a!columnsLayout(
                      columns: {
                        a!columnLayout(
                          contents: {
                            a!cardLayout(
                              contents: {
                                a!richTextDisplayField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  value: {"Loss History"},
                                  align: "CENTER"
                                )
                              },
                              marginBelow: "NONE",
                              height: "AUTO",
                              style: "#efefef",
                              showBorder: false
                            )
                          }
                        ),
                        a!columnLayout(
                          contents: {
                            a!cardLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: {"Risk Exposure"},
                                      color: "ACCENT",
                                      style: {"STRONG"}
                                    )
                                  },
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  align: "CENTER"
                                )
                              },
                              marginBelow: "NONE",
                              height: "AUTO",
                              style: "NONE",
                              borderColor: "ACCENT",
                              shape: "SEMI_ROUNDED",
                              decorativeBarPosition: "NONE"
                            )
                          }
                        )
                      },
                      marginBelow: "NONE",
                      alignVertical: "MIDDLE",
                      spacing: "DENSE"
                    )
                  },
                  marginBelow: "NONE",
                  height: "AUTO",
                  style: "#efefef",
                  showBorder: false,
                  padding: "EVEN_LESS",
                  shape: "SEMI_ROUNDED"
                )
              }
            ),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {}),
            a!columnLayout(contents: {})
          },
          marginBelow: "NONE",
          alignVertical: "MIDDLE"
        ),
        a!horizontalLine(marginAbove: "STANDARD", marginBelow: "NONE")
      },
      marginBelow: "NONE",
      height: "AUTO",
      style: "#ffffff",
      showBorder: false,
      borderColor: "#ffffff",
      padding: "NONE"
    ),

    if(
      local!activeSubTab = "lossHistory",
      a!cardLayout(
        contents: {
          a!stampField(
            labelPosition: "COLLAPSED",
            icon: "clock-o",
            marginBelow: "STANDARD",
            align: "CENTER",
            size: "MEDIUM",
            backgroundColor: "#EDEEFA",
            contentColor: "ACCENT"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(text: "Under Progress", size: "MEDIUM_PLUS", color: "ACCENT", style: "STRONG"),
            marginBelow: "LESS",
            align: "CENTER"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(text: "Loss History module is currently being developed.", color: "SECONDARY"),
            align: "CENTER"
          )
        },
        marginAbove: "STANDARD",
        padding: "MORE",
        shape: "SEMI_ROUNDED"
      ),

      /* RISK EXPOSURE - using a!paneLayout */
      a!paneLayout(
        panes: {
          /* ===== LEFT PANE ===== */
          a!pane(
            contents: {
              a!cardLayout(
                contents: {
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: a!headingField(
                          text: "Premises",
                          headingTag: "H2",
                          marginAbove: "LESS",
                          marginBelow: "EVEN_LESS",
                          size: "MEDIUM",
                          color: "SECONDARY",
                          fontWeight: "BOLD"
                        )
                      ),
                      a!sideBySideItem(
                        item: a!buttonArrayLayout(
                          buttons: a!buttonWidget(
                            label: "Add Premise",
                            size: "STANDARD",
                            icon: "plus-circle",
                            style: "SOLID"
                          ),
                          marginAbove: "EVEN_LESS",
                          marginBelow: "LESS",
                          align: "END"
                        )
                      )
                    },
                    marginAbove: "EVEN_LESS",
                    marginBelow: "NONE"
                  ),

                  /* Search */
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: a!textField(
                          labelPosition: "COLLAPSED",
                          placeholder: "Search premises...",
                          value: local!searchText,
                          saveInto: local!searchText,
                          refreshAfter: "KEYPRESS"
                        )
                      ),
                      a!sideBySideItem(
                        item: a!buttonArrayLayout(
                          buttons: a!buttonWidget(
                            label: "search",
                            size: "SMALL",
                            style: "GHOST"
                          ),
                          marginBelow: "NONE"
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    marginAbove: "LESS",
                    marginBelow: "EVEN_LESS",
                    alignVertical: "MIDDLE",
                    spacing: "STANDARD"
                  ),

                  /* Filters */
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: a!dropdownField(
                          labelPosition: "COLLAPSED",
                          placeholder: "Yr. Built",
                          choiceLabels: union(index(local!premises, "yearBuilt", {}), index(local!premises, "yearBuilt", {})),
                          choiceValues: union(index(local!premises, "yearBuilt", {}), index(local!premises, "yearBuilt", {})),
                          value: local!filterYear,
                          saveInto: local!filterYear,
                          searchDisplay: "AUTO",
                          marginBelow: "NONE"
                        )
                      ),
                      a!sideBySideItem(
                        item: a!dropdownField(
                          labelPosition: "COLLAPSED",
                          placeholder: "Country",
                          choiceLabels: union(index(local!premises, "country", {}), index(local!premises, "country", {})),
                          choiceValues: union(index(local!premises, "country", {}), index(local!premises, "country", {})),
                          value: local!filterCountry,
                          saveInto: local!filterCountry,
                          searchDisplay: "AUTO",
                          marginBelow: "NONE"
                        )
                      ),
                      a!sideBySideItem(
                        item: a!buttonArrayLayout(
                          buttons: a!buttonWidget(
                            label: "Clear",
                            size: "SMALL",
                            style: "LINK",
                            saveInto: {
                              a!save(local!filterYear, null),
                              a!save(local!filterCountry, null),
                              a!save(local!searchText, "")
                            }
                          ),
                          marginBelow: "NONE"
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    marginAbove: "STANDARD",
                    marginBelow: "STANDARD"
                  ),

                  /* Premise Cards - Clickable List */
                  a!forEach(
                    items: local!filteredPremises,
                    expression: a!cardLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: fv!item.location & " | " & fv!item.building,
                              color: if(fv!item.id = local!selectedPremiseId, "#FFFFFF", "STANDARD"),
                              style: "STRONG"
                            ),
                            char(10),
                            a!richTextItem(
                              text: fv!item.street & ", " & fv!item.city & ", " & fv!item.state,
                              size: "SMALL",
                              color: if(fv!item.id = local!selectedPremiseId, "#FFFFFF", "SECONDARY")
                            ),
                            char(10),
                            a!richTextItem(
                              text: fv!item.country & " - " & fv!item.zip,
                              size: "SMALL",
                              color: if(fv!item.id = local!selectedPremiseId, "#FFFFFF", "SECONDARY")
                            )
                          },
                          marginBelow: "NONE"
                        )
                      },
                      link: a!dynamicLink(
                        value: fv!item.id,
                        saveInto: local!selectedPremiseId
                      ),
                      marginBelow: "EVEN_LESS",
                      style: if(fv!item.id = local!selectedPremiseId, "ACCENT", "#FFFFFF"),
                      showBorder: false,
                      padding: "STANDARD",
                      shape: "SEMI_ROUNDED"
                    )
                  )
                },
                marginBelow: "NONE",
                style: "#ffffff",
                showBorder: false,
                padding: "LESS",
                shape: "SEMI_ROUNDED"
              )
            },
            width: "MEDIUM",
            padding: "NONE"
          ),

          /* ===== RIGHT PANE ===== */
          a!pane(
            contents: {
              /* Header */
              a!cardLayout(
                contents: {
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: {
                          a!headingField(
                            text: local!selectedPremise.location & " | " & local!selectedPremise.building,
                            marginAbove: "NONE",
                            marginBelow: "LESS",
                            size: "MEDIUM_PLUS",
                            fontWeight: "BOLD"
                          ),
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: a!richTextItem(
                              text: local!selectedPremise.street & ", " & local!selectedPremise.city & ", " & local!selectedPremise.state & ", " & local!selectedPremise.country & " " & local!selectedPremise.zip,
                              color: "#666666"
                            )
                          )
                        }
                      ),
                      a!sideBySideItem(
                        item: a!buttonArrayLayout(
                          buttons: {
                            a!buttonWidget(
                              label: "Delete Premise",
                              size: "STANDARD",
                              color: "#666666",
                              icon: "trash",
                              style: "OUTLINE"
                            ),
                            a!buttonWidget(
                              label: "Edit premise",
                              icon: "pencil-square-o",
                              style: "SOLID"
                            )
                          },
                          marginBelow: "NONE",
                          align: "END"
                        ),
                        width: "MINIMIZE"
                      )
                    }
                  ),

                  /* Info Cards */
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(
                        contents: a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                icon: "hard-hat",
                                size: "TINY",
                                backgroundColor: "#FFEED3",
                                contentColor: "#D97706"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: "Construction Type", size: "SMALL", style: "STRONG"),
                                  marginBelow: "NONE"
                                ),
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: local!selectedPremise.constructionType, size: "SMALL"),
                                  marginBelow: "NONE"
                                )
                              }
                            )
                          },
                          spacing: "DENSE"
                        )
                      ),
                      a!columnLayout(
                        contents: a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                icon: "home",
                                size: "TINY",
                                backgroundColor: "#FFEED3",
                                contentColor: "#D97706"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: "Bld. Improvement Roofing Year", size: "SMALL", style: "STRONG"),
                                  marginBelow: "NONE"
                                ),
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: local!selectedPremise.roofingYear, size: "SMALL"),
                                  marginBelow: "NONE"
                                )
                              }
                            )
                          },
                          spacing: "DENSE"
                        )
                      ),
                      a!columnLayout(
                        contents: a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                icon: "wrench",
                                size: "TINY",
                                backgroundColor: "#FFEED3",
                                contentColor: "#D97706"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: "Year Built", size: "SMALL", style: "STRONG"),
                                  marginBelow: "NONE"
                                ),
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: a!richTextItem(text: local!selectedPremise.yearBuilt, size: "SMALL"),
                                  marginBelow: "NONE"
                                )
                              }
                            )
                          },
                          spacing: "DENSE"
                        )
                      )
                    },
                    marginAbove: "LESS",
                    marginBelow: "LESS",
                    spacing: "STANDARD"
                  )
                },
                marginBelow: "NONE",
                style: "TRANSPARENT",
                showBorder: false,
                borderColor: "#fafafc",
                padding: "NONE",
                shape: "SEMI_ROUNDED",
                decorativeBarPosition: "NONE"
              ),

              /* Coverages Header */
              a!sideBySideLayout(
                items: {
                  a!sideBySideItem(
                    item: a!headingField(
                      text: "Subjects of Insurance",
                      marginBelow: "NONE",
                      size: "SMALL",
                      color: "SECONDARY",
                      fontWeight: "BOLD"
                    )
                  ),
                  a!sideBySideItem(
                    item: a!buttonArrayLayout(
                      buttons: a!buttonWidget(
                        label: "Add Subject of Insurance",
                        size: "SMALL",
                        icon: "plus-circle",
                        style: "LINK"
                      ),
                      marginBelow: "NONE",
                      align: "END"
                    )
                  )
                },
                marginAbove: "STANDARD",
                marginBelow: "STANDARD",
                alignVertical: "MIDDLE"
              ),

              /* Coverages Table */
              a!cardLayout(
                contents: {
                  a!gridField(
                    labelPosition: "COLLAPSED",
                    data: todatasubset(local!coverages, fv!pagingInfo),
                    columns: {
                      a!gridColumn(label: "Subject of Insurance", value: fv!row.subject, align: "START", width: "NARROW_PLUS"),
                      a!gridColumn(label: "Amount", value: fv!row.amount, align: "END"),
                      a!gridColumn(label: "Coins %", value: fv!row.coins, align: "END", width: "NARROW"),
                      a!gridColumn(label: "Valuation", value: fv!row.valuation),
                      a!gridColumn(label: "Cause of Loss", value: fv!row.cause),
                      a!gridColumn(label: "Inflation Guard", value: fv!row.inflation, align: "END", width: "NARROW"),
                      a!gridColumn(label: "DED", value: fv!row.ded, align: "END"),
                      a!gridColumn(label: "BLKT#", value: fv!row.blkt),
                      a!gridColumn(label: "Forms & Conditions", value: fv!row.forms)
                    },
                    pageSize: 10,
                    shadeAlternateRows: false
                  )
                },
                marginAbove: "LESS",
                showShadow: true,
                showBorder: false,
                padding: "EVEN_LESS",
                shape: "SEMI_ROUNDED"
              )
            },
            width: "AUTO",
            backgroundColor: "#fafafc",
            padding: "LESS"
          )
        },
        showPaneDividers: false
      )
    )
  }
)
