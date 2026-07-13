/* 
 * Risk Exposure - Add Subject of Insurance (Add Coverage) Dialog
 * Shows premise context (read-only) + editable SOI grid for adding new coverages
 * Aurora Design System compliant
 * 
 * Replace:
 *   - ri!premiseId → the premise to add coverages to
 *   - local!premise → rule!RE_GetPremiseById(ri!premiseId)
 *   - saveInto on Add → rule!RE_CreateCoverages(ri!premiseId, local!newCoverages)
 */

a!localVariables(
  /* Premise context - read only display */
  local!premise: a!map(
    location: "Location 1",
    building: "Building 1",
    street: "42 Marine Drive, Asphalt Colony",
    city: "Mumbai",
    state: "Maharashtra",
    country: "India",
    zip: "400020",
    constructionType: "Non Combustible",
    roofingYear: "2018",
    yearBuilt: "1997"
  ),

  /* New coverages to add */
  local!newCoverages: {
    a!map(id: 1, subject: "", amount: "", coins: "", valuation: "", cause: "", inflation: "", ded: "", blkt: "", forms: "")
  },

  /* Dropdown options */
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},

  a!formLayout(
    label: "Add Subject of Insurance",
    contents: {
      /* ===== PREMISE CONTEXT (Read-only) ===== */
      a!sectionLayout(
        label: "Premise Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
        contents: {
          /* Location title + address */
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: local!premise.location & " | " & local!premise.building,
              size: "MEDIUM_PLUS",
              style: "STRONG"
            ),
            marginBelow: "NONE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: local!premise.street & ", " & local!premise.city & ", " & local!premise.state & ", " & local!premise.country & ", " & local!premise.zip,
              color: "SECONDARY"
            ),
            marginBelow: "STANDARD"
          ),

          /* Info cards */
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: a!sideBySideLayout(
                  spacing: "DENSE",
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
                          value: a!richTextItem(text: local!premise.constructionType, size: "SMALL"),
                          marginBelow: "NONE"
                        )
                      }
                    )
                  }
                )
              ),
              a!columnLayout(
                contents: a!sideBySideLayout(
                  spacing: "DENSE",
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
                          value: a!richTextItem(text: local!premise.roofingYear, size: "SMALL"),
                          marginBelow: "NONE"
                        )
                      }
                    )
                  }
                )
              ),
              a!columnLayout(
                contents: a!sideBySideLayout(
                  spacing: "DENSE",
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
                          value: a!richTextItem(text: local!premise.yearBuilt, size: "SMALL"),
                          marginBelow: "NONE"
                        )
                      }
                    )
                  }
                )
              )
            },
            spacing: "STANDARD"
          )
        }
      ),

      /* ===== NEW COVERAGES SECTION ===== */
      a!sectionLayout(
        label: "",
        contents: {
          /* Header with Add Row */
          a!sideBySideLayout(
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "Subjects of Insurance",
                    color: "#878787",
                    style: "STRONG"
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
                    caption: "Add Row",
                    linkStyle: "STANDALONE",
                    link: a!dynamicLink(
                      value: append(
                        local!newCoverages,
                        a!map(id: count(local!newCoverages) + 1, subject: "", amount: "", coins: "", valuation: "", cause: "", inflation: "", ded: "", blkt: "", forms: "")
                      ),
                      saveInto: local!newCoverages
                    )
                  ),
                  marginBelow: "NONE"
                )
              )
            },
            marginBelow: "STANDARD"
          ),

          /* Editable Grid */
          a!cardLayout(
            padding: "STANDARD",
            shape: "SEMI_ROUNDED",
            borderColor: "#EDEEFA",
            style: "#F5F5F7",
            showBorder: true,
            contents: {
              a!gridLayout(
                labelPosition: "COLLAPSED",
                headerCells: {
                  a!gridLayoutHeaderCell(label: "Subject of Insurance"),
                  a!gridLayoutHeaderCell(label: "Amount"),
                  a!gridLayoutHeaderCell(label: "Coins %"),
                  a!gridLayoutHeaderCell(label: "Valuation"),
                  a!gridLayoutHeaderCell(label: "Cause of Loss"),
                  a!gridLayoutHeaderCell(label: "Inflation Guard"),
                  a!gridLayoutHeaderCell(label: "DED"),
                  a!gridLayoutHeaderCell(label: "BLKT#"),
                  a!gridLayoutHeaderCell(label: "Forms & Conditions"),
                  a!gridLayoutHeaderCell(label: "")
                },
                rows: a!forEach(
                  items: local!newCoverages,
                  expression: a!gridRowLayout(
                    contents: {
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!subjectOptions,
                        choiceValues: local!subjectOptions,
                        value: fv!item.subject,
                        saveInto: local!newCoverages[fv!index].subject
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Enter value",
                        value: fv!item.amount,
                        saveInto: local!newCoverages[fv!index].amount
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.coins,
                        saveInto: local!newCoverages[fv!index].coins
                      ),
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!valuationOptions,
                        choiceValues: local!valuationOptions,
                        value: fv!item.valuation,
                        saveInto: local!newCoverages[fv!index].valuation
                      ),
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!causeOptions,
                        choiceValues: local!causeOptions,
                        value: fv!item.cause,
                        saveInto: local!newCoverages[fv!index].cause
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Enter value",
                        value: fv!item.inflation,
                        saveInto: local!newCoverages[fv!index].inflation
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.ded,
                        saveInto: local!newCoverages[fv!index].ded
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.blkt,
                        saveInto: local!newCoverages[fv!index].blkt
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Enter value",
                        value: fv!item.forms,
                        saveInto: local!newCoverages[fv!index].forms
                      ),
                      /* Clone + Remove */
                      a!sideBySideLayout(
                        spacing: "DENSE",
                        items: {
                          a!sideBySideItem(
                            width: "MINIMIZE",
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextIcon(
                                icon: "clone",
                                caption: "Duplicate",
                                linkStyle: "STANDALONE",
                                link: a!dynamicLink(
                                  value: insert(local!newCoverages, fv!item, fv!index + 1),
                                  saveInto: local!newCoverages
                                )
                              ),
                              marginBelow: "NONE"
                            )
                          ),
                          a!sideBySideItem(
                            width: "MINIMIZE",
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextIcon(
                                icon: "times",
                                caption: "Remove",
                                color: "NEGATIVE",
                                linkStyle: "STANDALONE",
                                showWhen: count(local!newCoverages) > 1,
                                link: a!dynamicLink(
                                  value: remove(local!newCoverages, fv!index),
                                  saveInto: local!newCoverages
                                )
                              ),
                              marginBelow: "NONE"
                            )
                          )
                        }
                      )
                    }
                  )
                ),
                selectable: false
              )
            }
          )
        }
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {
        a!buttonWidget(
          label: "Add",
          style: "SOLID",
          submit: true,
          loadingIndicator: true
          /* saveInto: rule!RE_CreateCoverages(ri!premiseId, local!newCoverages) */
        )
      },
      secondaryButtons: {
        a!buttonWidget(
          label: "Cancel",
          style: "OUTLINE",
          color: "SECONDARY",
          validate: false,
          submit: true
        )
      }
    )
  )
)
