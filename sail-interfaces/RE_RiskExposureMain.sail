/* 
 * Risk Exposure - Main Interface
 * Split-panel layout: Left (Premise list) + Right (Building detail + Coverages)
 * Aurora Design System compliant
 * 
 * Replace sample data with actual record queries:
 *   - local!premises → rule!RE_GetAllPremises()
 *   - local!selectedPremise → rule!RE_GetPremiseById(local!selectedId)
 *   - local!coverages → rule!RE_GetCoveragesByPremise(local!selectedId)
 */

a!localVariables(
  /* Sample premise data */
  local!premises: {
    a!map(id: 1, location: "Location 1", building: "Building 1", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020", constructionType: "Non Combustible", roofingYear: "2018", yearBuilt: "1997"),
    a!map(id: 2, location: "Location 1", building: "Building 2", street: "125 Oxford Street, Westminster", city: "London", state: "England", country: "United Kingdom", zip: "W1D 2HX", constructionType: "Fire Resistive", roofingYear: "2016", yearBuilt: "1993"),
    a!map(id: 3, location: "Location 1", building: "Building 3", street: "350 George Street", city: "Sydney", state: "New South Wales", country: "Australia", zip: "2000", constructionType: "Frame", roofingYear: "2020", yearBuilt: "2001"),
    a!map(id: 4, location: "Location 2", building: "Building 1", street: "742 Lexington Avenue, Manhattan", city: "New York", state: "New York", country: "USA", zip: "10022", constructionType: "Masonry Non Combustible", roofingYear: "2015", yearBuilt: "1990"),
    a!map(id: 5, location: "Location 2", building: "Building 2", street: "18 Orchard Road", city: "Singapore", state: "Singapore", country: "Singapore", zip: "238823", constructionType: "Modified Fire Resistive", roofingYear: "2019", yearBuilt: "1998")
  },

  /* Sample coverage data for selected premise */
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

  /* Derived */
  local!selectedPremise: index(
    local!premises,
    wherecontains(local!selectedPremiseId, tointeger(index(local!premises, "id", {}))),
    {}
  ),

  local!filteredPremises: a!forEach(
    items: local!premises,
    expression: if(
      and(
        or(
          isnull(local!searchText),
          local!searchText = "",
          search(lower(local!searchText), lower(fv!item.city)),
          search(lower(local!searchText), lower(fv!item.street)),
          search(lower(local!searchText), lower(fv!item.country)),
          search(lower(local!searchText), lower(fv!item.location)),
          search(lower(local!searchText), lower(fv!item.building))
        ),
        or(isnull(local!filterCountry), fv!item.country = local!filterCountry),
        or(isnull(local!filterYear), fv!item.yearBuilt = local!filterYear)
      ),
      fv!item,
      {}
    )
  ),

  local!uniqueCountries: union(index(local!premises, "country", {}), index(local!premises, "country", {})),
  local!uniqueYears: union(index(local!premises, "yearBuilt", {}), index(local!premises, "yearBuilt", {})),

  /* Main Layout: Two columns */
  a!columnsLayout(
    columns: {
      /* ===== LEFT PANEL: Premise Navigation ===== */
      a!columnLayout(
        width: "NARROW_PLUS",
        contents: {
          /* Header: Title + Add Premise */
          a!sideBySideLayout(
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "Premises",
                    size: "MEDIUM",
                    style: "STRONG",
                    color: "#878787"
                  ),
                  marginBelow: "NONE"
                )
              ),
              a!sideBySideItem(
                width: "MINIMIZE",
                item: a!buttonArrayLayout(
                  buttons: a!buttonWidget(
                    label: "Add Premise",
                    icon: "plus-circle",
                    size: "SMALL",
                    style: "SOLID"
                    /* saveInto: launch add premise action */
                  ),
                  marginBelow: "NONE"
                )
              )
            },
            marginBelow: "STANDARD"
          ),

          /* Search */
          a!textField(
            labelPosition: "COLLAPSED",
            placeholder: "Search premises...",
            value: local!searchText,
            saveInto: local!searchText,
            refreshAfter: "KEYPRESS",
            marginBelow: "LESS"
          ),

          /* Filters */
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: a!dropdownField(
                  label: "Country",
                  labelPosition: "COLLAPSED",
                  placeholder: "All Countries",
                  choiceLabels: local!uniqueCountries,
                  choiceValues: local!uniqueCountries,
                  value: local!filterCountry,
                  saveInto: local!filterCountry
                )
              ),
              a!columnLayout(
                contents: a!dropdownField(
                  label: "Yr. Built",
                  labelPosition: "COLLAPSED",
                  placeholder: "All Years",
                  choiceLabels: local!uniqueYears,
                  choiceValues: local!uniqueYears,
                  value: local!filterYear,
                  saveInto: local!filterYear
                )
              )
            },
            spacing: "DENSE",
            marginBelow: "STANDARD"
          ),

          /* Premise List */
          a!forEach(
            items: local!filteredPremises,
            expression: a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: fv!item.location & " | " & fv!item.building,
                      style: "STRONG"
                    )
                  },
                  marginBelow: "NONE"
                ),
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: fv!item.street & ", " & fv!item.city & ", " & fv!item.state,
                    color: "SECONDARY",
                    size: "SMALL"
                  ),
                  marginBelow: "NONE"
                ),
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: fv!item.country & " - " & fv!item.zip,
                    color: "SECONDARY",
                    size: "SMALL"
                  ),
                  marginBelow: "NONE"
                )
              },
              link: a!dynamicLink(
                value: fv!item.id,
                saveInto: local!selectedPremiseId
              ),
              padding: "STANDARD",
              shape: "SEMI_ROUNDED",
              marginBelow: "LESS",
              borderColor: if(
                fv!item.id = local!selectedPremiseId,
                "ACCENT",
                "#EDEEFA"
              ),
              accessibilityText: if(
                fv!item.id = local!selectedPremiseId,
                "Selected",
                ""
              )
            )
          )
        }
      ),

      /* ===== RIGHT PANEL: Building Detail + Coverages ===== */
      a!columnLayout(
        contents: {
          /* Header Card - Violet background */
          a!cardLayout(
            style: "#E8E7FF",
            showBorder: false,
            padding: "STANDARD",
            shape: "SEMI_ROUNDED",
            marginBelow: "STANDARD",
            contents: {
              /* Title row + Actions */
              a!sideBySideLayout(
                alignVertical: "MIDDLE",
                items: {
                  a!sideBySideItem(
                    item: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: a!richTextItem(
                          text: local!selectedPremise.location & " | " & local!selectedPremise.building,
                          size: "MEDIUM_PLUS",
                          style: "STRONG"
                        ),
                        marginBelow: "NONE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: a!richTextItem(
                          text: local!selectedPremise.street & ", " & local!selectedPremise.city & ", " & local!selectedPremise.state & ", " & local!selectedPremise.country & ", " & local!selectedPremise.zip,
                          color: "SECONDARY",
                          size: "SMALL"
                        ),
                        marginBelow: "NONE"
                      )
                    }
                  ),
                  a!sideBySideItem(
                    width: "MINIMIZE",
                    item: a!buttonArrayLayout(
                      buttons: {
                        a!buttonWidget(
                          label: "Delete Premise",
                          icon: "trash-o",
                          size: "SMALL",
                          style: "OUTLINE",
                          color: "SECONDARY"
                          /* saveInto: launch delete confirmation */
                        ),
                        a!buttonWidget(
                          label: "Edit Premise",
                          icon: "pencil",
                          size: "SMALL",
                          style: "SOLID"
                          /* saveInto: launch edit premise action */
                        )
                      },
                      marginBelow: "NONE"
                    )
                  )
                },
                marginBelow: "STANDARD"
              ),

              /* Info Cards Row */
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          width: "MINIMIZE",
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "hard-hat",
                            backgroundColor: "#FFEED3",
                            contentColor: "#D97706",
                            size: "TINY"
                          )
                        ),
                        a!sideBySideItem(
                          item: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextItem(text: "Construction Type", style: "STRONG", size: "SMALL"),
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
                          width: "MINIMIZE",
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "home",
                            backgroundColor: "#FFEED3",
                            contentColor: "#D97706",
                            size: "TINY"
                          )
                        ),
                        a!sideBySideItem(
                          item: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextItem(text: "Bld. Improvement Roofing Year", style: "STRONG", size: "SMALL"),
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
                          width: "MINIMIZE",
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "wrench",
                            backgroundColor: "#FFEED3",
                            contentColor: "#D97706",
                            size: "TINY"
                          )
                        ),
                        a!sideBySideItem(
                          item: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextItem(text: "Year Built", style: "STRONG", size: "SMALL"),
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
                spacing: "STANDARD"
              )
            }
          ),

          /* Property Coverages Section */
          a!sideBySideLayout(
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "Property Coverages",
                    color: "#878787",
                    style: "STRONG",
                    size: "STANDARD"
                  ),
                  marginBelow: "NONE"
                )
              ),
              a!sideBySideItem(
                width: "MINIMIZE",
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextIcon(
                    icon: "plus-circle",
                    caption: "Add Coverage",
                    linkStyle: "STANDALONE",
                    link: a!dynamicLink(
                      /* saveInto: launch add coverage action */
                    )
                  ),
                  marginBelow: "NONE"
                )
              )
            },
            marginBelow: "LESS"
          ),

          /* Coverages Grid */
          a!gridField(
            labelPosition: "COLLAPSED",
            data: todatasubset(local!coverages, fv!pagingInfo),
            columns: {
              a!gridColumn(
                label: "Subject of Insurance",
                value: fv!row.subject
              ),
              a!gridColumn(
                label: "Amount",
                value: fv!row.amount
              ),
              a!gridColumn(
                label: "Coins %",
                value: fv!row.coins
              ),
              a!gridColumn(
                label: "Valuation",
                value: fv!row.valuation
              ),
              a!gridColumn(
                label: "Cause of Loss",
                value: fv!row.cause
              ),
              a!gridColumn(
                label: "Inflation Guard",
                value: fv!row.inflation
              ),
              a!gridColumn(
                label: "DED",
                value: fv!row.ded
              ),
              a!gridColumn(
                label: "BLKT#",
                value: fv!row.blkt
              ),
              a!gridColumn(
                label: "Forms & Conditions",
                value: fv!row.forms
              )
            },
            pageSize: 10,
            shadeAlternateRows: false,
            rowHeader: 1
          )
        }
      )
    },
    spacing: "STANDARD"
  )
)
