/* 
 * Risk Exposure - Edit Premise Form (Record Action Dialog)
 * Structured modal: Premise Details + Building Details + Subjects of Insurance
 * Aurora Design System compliant
 * 
 * This interface is used as a Record Action form in a dialog.
 * 
 * Replace:
 *   - ri!premise → record input for premise record
 *   - local!coverages → rule!RE_GetCoveragesByPremise(ri!premise.id)
 *   - saveInto on buttons → write to data store
 */

a!localVariables(
  /* Premise fields - in production these come from ri!premise */
  local!locationNum: "1",
  local!buildingNum: "1",
  local!street: "42 Marine Drive, Asphalt Colony",
  local!city: "Mumbai",
  local!state: "Maharashtra",
  local!country: "India",
  local!zip: "400020",
  local!constructionType: "Non Combustible",
  local!roofingYear: "2018",
  local!yearBuilt: "1997",

  /* Coverages - editable grid data */
  local!coverages: {
    a!map(id: 1, subject: "Building", amount: "$2,500,000", coins: "90%", valuation: "Replacement Cost", cause: "Special Excluding Theft", inflation: "300", ded: "500", blkt: "ASI12", forms: "Special Property Coverage Form with Protective Safeguards endorsement."),
    a!map(id: 2, subject: "Business Personal Property", amount: "$650,000", coins: "80%", valuation: "Actual Cash Value", cause: "Broad", inflation: "250", ded: "250", blkt: "BPP08", forms: "Business Personal Property coverage subject to inventory reporting requirements."),
    a!map(id: 3, subject: "Business Income with Extra Expense", amount: "$900,000", coins: "100%", valuation: "Agreed Amount", cause: "Special Excluding Theft", inflation: "200", ded: "500", blkt: "BIE21", forms: "Coverage applies during the period of restoration only."),
    a!map(id: 4, subject: "Furniture & Fixtures", amount: "$180,000", coins: "90%", valuation: "Replacement Cost", cause: "Basic", inflation: "150", ded: "100", blkt: "FF14", forms: "Replacement limited to like-kind quality and condition.")
  },

  /* Dropdown options */
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},
  local!constructionOptions: {"Frame", "Joisted Masonry", "Non Combustible", "Masonry Non Combustible", "Modified Fire Resistive", "Fire Resistive"},

  /* State for confirmation dialog */
  local!showDeleteConfirmation: false,
  local!rowToDelete: null,

  a!formLayout(
    label: "Edit Premise",
    contents: {
      /* ===== PREMISE DETAILS SECTION ===== */
      a!sectionLayout(
        label: "Premise Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
        contents: {
          a!cardLayout(
            padding: "STANDARD",
            shape: "SEMI_ROUNDED",
            borderColor: "#EDEEFA",
            style: "#F5F5F7",
            showBorder: true,
            contents: {
              /* Row 1: Location # + Building # */
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    width: "NARROW",
                    contents: a!integerField(
                      label: "Location #",
                      value: local!locationNum,
                      saveInto: local!locationNum,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    width: "NARROW",
                    contents: a!integerField(
                      label: "Building #",
                      value: local!buildingNum,
                      saveInto: local!buildingNum,
                      required: true
                    )
                  ),
                  a!columnLayout()
                }
              ),

              /* Row 2: Street Address (full width) */
              a!textField(
                label: "Street Address",
                value: local!street,
                saveInto: local!street,
                required: true
              ),

              /* Row 3: City, State, Country, Zip */
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: a!textField(
                      label: "City",
                      value: local!city,
                      saveInto: local!city,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    contents: a!textField(
                      label: "State",
                      value: local!state,
                      saveInto: local!state,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    contents: a!textField(
                      label: "Country",
                      value: local!country,
                      saveInto: local!country,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    width: "NARROW",
                    contents: a!textField(
                      label: "Zip Code",
                      value: local!zip,
                      saveInto: local!zip,
                      required: true
                    )
                  )
                }
              )
            }
          )
        }
      ),

      /* ===== BUILDING DETAILS SECTION ===== */
      a!sectionLayout(
        label: "Building Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
        contents: {
          a!cardLayout(
            padding: "STANDARD",
            shape: "SEMI_ROUNDED",
            borderColor: "#EDEEFA",
            style: "#F5F5F7",
            showBorder: true,
            contents: {
              a!columnsLayout(
                columns: {
                  a!columnLayout(
                    contents: a!dropdownField(
                      label: "Construction Type",
                      placeholder: "Select Construction Type",
                      choiceLabels: local!constructionOptions,
                      choiceValues: local!constructionOptions,
                      value: local!constructionType,
                      saveInto: local!constructionType,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    contents: a!textField(
                      label: "Bld. Improvement Roofing Yr.",
                      value: local!roofingYear,
                      saveInto: local!roofingYear,
                      required: true
                    )
                  ),
                  a!columnLayout(
                    contents: a!textField(
                      label: "Yr. Built",
                      value: local!yearBuilt,
                      saveInto: local!yearBuilt,
                      required: true
                    )
                  )
                }
              )
            }
          )
        }
      ),

      /* ===== SUBJECTS OF INSURANCE SECTION ===== */
      a!sectionLayout(
        label: "",
        contents: {
          /* Section header with Add button */
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
                    caption: "Add Subject of Insurance",
                    linkStyle: "STANDALONE",
                    link: a!dynamicLink(
                      value: append(
                        local!coverages,
                        a!map(id: count(local!coverages) + 1, subject: "", amount: "", coins: "", valuation: "", cause: "", inflation: "", ded: "", blkt: "", forms: "")
                      ),
                      saveInto: local!coverages
                    )
                  ),
                  marginBelow: "NONE"
                )
              )
            },
            marginBelow: "STANDARD"
          ),

          /* Editable Coverages Grid */
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
                  a!gridLayoutHeaderCell(label: "Actions")
                },
                rows: a!forEach(
                  items: local!coverages,
                  expression: a!gridRowLayout(
                    contents: {
                      /* Subject of Insurance - Dropdown */
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!subjectOptions,
                        choiceValues: local!subjectOptions,
                        value: fv!item.subject,
                        saveInto: local!coverages[fv!index].subject
                      ),
                      /* Amount */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.amount,
                        saveInto: local!coverages[fv!index].amount
                      ),
                      /* Coins % */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.coins,
                        saveInto: local!coverages[fv!index].coins
                      ),
                      /* Valuation - Dropdown */
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!valuationOptions,
                        choiceValues: local!valuationOptions,
                        value: fv!item.valuation,
                        saveInto: local!coverages[fv!index].valuation
                      ),
                      /* Cause of Loss - Dropdown */
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!causeOptions,
                        choiceValues: local!causeOptions,
                        value: fv!item.cause,
                        saveInto: local!coverages[fv!index].cause
                      ),
                      /* Inflation Guard */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.inflation,
                        saveInto: local!coverages[fv!index].inflation
                      ),
                      /* DED */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.ded,
                        saveInto: local!coverages[fv!index].ded
                      ),
                      /* BLKT# */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.blkt,
                        saveInto: local!coverages[fv!index].blkt
                      ),
                      /* Forms & Conditions */
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.forms,
                        saveInto: local!coverages[fv!index].forms
                      ),
                      /* Actions: Clone + Remove */
                      a!sideBySideLayout(
                        spacing: "DENSE",
                        items: {
                          a!sideBySideItem(
                            width: "MINIMIZE",
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: a!richTextIcon(
                                icon: "clone",
                                caption: "Duplicate Row",
                                linkStyle: "STANDALONE",
                                link: a!dynamicLink(
                                  value: insert(local!coverages, fv!item, fv!index + 1),
                                  saveInto: local!coverages
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
                                caption: "Remove Row",
                                color: "NEGATIVE",
                                linkStyle: "STANDALONE",
                                link: a!dynamicLink(
                                  value: fv!index,
                                  saveInto: {
                                    local!rowToDelete,
                                    a!save(local!showDeleteConfirmation, true)
                                  }
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
          ),

          /* Remove SOI Confirmation */
          if(
            local!showDeleteConfirmation,
            a!cardLayout(
              style: "#FFF5E6",
              showBorder: true,
              borderColor: "#D97706",
              padding: "STANDARD",
              shape: "SEMI_ROUNDED",
              marginAbove: "STANDARD",
              contents: {
                a!sideBySideLayout(
                  alignVertical: "MIDDLE",
                  items: {
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(icon: "exclamation-triangle", color: "#D97706"),
                          " ",
                          a!richTextItem(text: "Are you sure you want to remove this coverage? This action cannot be undone.", style: "STRONG")
                        },
                        marginBelow: "NONE"
                      )
                    ),
                    a!sideBySideItem(
                      width: "MINIMIZE",
                      item: a!buttonArrayLayout(
                        buttons: {
                          a!buttonWidget(
                            label: "Cancel",
                            style: "OUTLINE",
                            color: "SECONDARY",
                            size: "SMALL",
                            saveInto: a!save(local!showDeleteConfirmation, false)
                          ),
                          a!buttonWidget(
                            label: "Remove",
                            style: "OUTLINE",
                            color: "NEGATIVE",
                            size: "SMALL",
                            saveInto: {
                              a!save(local!coverages, remove(local!coverages, local!rowToDelete)),
                              a!save(local!showDeleteConfirmation, false)
                            }
                          )
                        },
                        marginBelow: "NONE"
                      )
                    )
                  }
                )
              }
            ),
            {}
          )
        }
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {
        a!buttonWidget(
          label: "Save",
          style: "SOLID",
          submit: true,
          loadingIndicator: true
          /* saveInto: write premise + coverages to data store */
        )
      },
      secondaryButtons: {
        a!buttonWidget(
          label: "Cancel",
          style: "OUTLINE",
          color: "SECONDARY",
          validate: false,
          submit: true
          /* saveInto: close dialog */
        )
      }
    )
  )
)
