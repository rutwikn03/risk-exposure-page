a!localVariables(
  local!locationNum: 1,
  local!buildingNum: 1,
  local!street: "42 Marine Drive, Asphalt Colony",
  local!city: "Mumbai",
  local!state: "Maharashtra",
  local!country: "India",
  local!zip: "400020",
  local!constructionType: "Non Combustible",
  local!roofingYear: "2018",
  local!yearBuilt: "1997",
  local!coverages: {
    a!map(subject: "Building", amount: "$2,500,000", coins: "90%", valuation: "Replacement Cost", cause: "Special Excluding Theft", inflation: "300", ded: "500", blkt: "ASI12", forms: "Special Property Coverage Form with Protective Safeguards endorsement."),
    a!map(subject: "Business Personal Property", amount: "$650,000", coins: "80%", valuation: "Actual Cash Value", cause: "Broad", inflation: "250", ded: "250", blkt: "BPP08", forms: "Business Personal Property coverage subject to inventory reporting requirements."),
    a!map(subject: "Furniture & Fixtures", amount: "$180,000", coins: "90%", valuation: "Replacement Cost", cause: "Basic", inflation: "150", ded: "100", blkt: "FF14", forms: "Replacement limited to like-kind quality and condition.")
  },
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},
  local!constructionOptions: {"Frame", "Joisted Masonry", "Non Combustible", "Masonry Non Combustible", "Modified Fire Resistive", "Fire Resistive"},
  a!formLayout(
    label: "Edit Premise",
    contents: {
      /* Premise Details (left) + Building Details (right) side by side */
      a!columnsLayout(
        columns: {
          /* LEFT: Premise Details */
          a!columnLayout(
            contents: {
              a!sectionLayout(
                label: "Premise Details",
                labelSize: "SMALL",
                labelColor: "SECONDARY",
                contents: {
                  a!cardLayout(
                    style: "#F5F5F7",
                    showBorder: true,
                    borderColor: "#EDEEFA",
                    shape: "SEMI_ROUNDED",
                    padding: "STANDARD",
                    contents: {
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            width: "NARROW",
                            contents: {
                              a!integerField(
                                label: "Location #",
                                value: local!locationNum,
                                saveInto: local!locationNum,
                                required: true
                              )
                            }
                          ),
                          a!columnLayout(
                            width: "NARROW",
                            contents: {
                              a!integerField(
                                label: "Building #",
                                value: local!buildingNum,
                                saveInto: local!buildingNum,
                                required: true
                              )
                            }
                          ),
                          a!columnLayout()
                        }
                      ),
                      a!textField(
                        label: "Street Address",
                        value: local!street,
                        saveInto: local!street,
                        required: true
                      ),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!textField(
                                label: "City",
                                value: local!city,
                                saveInto: local!city,
                                required: true
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!textField(
                                label: "State",
                                value: local!state,
                                saveInto: local!state,
                                required: true
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!textField(
                                label: "Country",
                                value: local!country,
                                saveInto: local!country,
                                required: true
                              )
                            }
                          ),
                          a!columnLayout(
                            width: "NARROW",
                            contents: {
                              a!textField(
                                label: "Zip Code",
                                value: local!zip,
                                saveInto: local!zip,
                                required: true
                              )
                            }
                          )
                        }
                      )
                    }
                  )
                }
              )
            }
          ),
          /* RIGHT: Building Details in light gray card */
          a!columnLayout(
            width: "NARROW_PLUS",
            contents: {
              a!sectionLayout(
                label: "Building Details",
                labelSize: "SMALL",
                labelColor: "SECONDARY",
                contents: {
                  a!cardLayout(
                    style: "#F5F5F7",
                    showBorder: true,
                    borderColor: "#EDEEFA",
                    shape: "SEMI_ROUNDED",
                    padding: "STANDARD",
                    contents: {
                      a!dropdownField(
                        label: "Construction Type",
                        placeholder: "Select Construction Type",
                        choiceLabels: local!constructionOptions,
                        choiceValues: local!constructionOptions,
                        value: local!constructionType,
                        saveInto: local!constructionType,
                        required: true
                      ),
                      a!textField(
                        label: "Bld. Improvement Roofing Yr.",
                        value: local!roofingYear,
                        saveInto: local!roofingYear,
                        required: true
                      ),
                      a!textField(
                        label: "Yr. Built",
                        value: local!yearBuilt,
                        saveInto: local!yearBuilt,
                        required: true
                      )
                    }
                  )
                }
              )
            }
          )
        }
      ),
      /* Subjects of Insurance - full width below */
      a!sectionLayout(
        label: "",
        contents: {
          /* Header: Title + Add button inline, outside gray box */
          a!sideBySideLayout(
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "Subjects of Insurance",
                    color: "SECONDARY",
                    style: "STRONG"
                  ),
                  marginBelow: "NONE"
                )
              ),
              a!sideBySideItem(
                width: "MINIMIZE",
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(
                      icon: "plus-circle",
                      color: "ACCENT",
                      linkStyle: "STANDALONE",
                      link: a!dynamicLink(
                        value: append(
                          local!coverages,
                          a!map(subject: null, amount: "", coins: "", valuation: null, cause: null, inflation: "", ded: "", blkt: "", forms: "")
                        ),
                        saveInto: local!coverages
                      )
                    ),
                    " ",
                    a!richTextItem(
                      text: "Add Subject of Insurance",
                      color: "ACCENT",
                      style: "STRONG",
                      link: a!dynamicLink(
                        value: append(
                          local!coverages,
                          a!map(subject: null, amount: "", coins: "", valuation: null, cause: null, inflation: "", ded: "", blkt: "", forms: "")
                        ),
                        saveInto: local!coverages
                      )
                    )
                  },
                  marginBelow: "NONE"
                )
              )
            },
            marginBelow: "STANDARD"
          ),
          /* Gray box with grid - scrollable when rows grow */
          a!cardLayout(
            height: "MEDIUM_PLUS",
            style: "#F5F5F7",
            showBorder: true,
            borderColor: "#EDEEFA",
            shape: "SEMI_ROUNDED",
            padding: "LESS",
            contents: {
              a!gridLayout(
                labelPosition: "COLLAPSED",
                headerCells: {
                  a!gridLayoutHeaderCell(label: "Subject of Insurance"),
                  a!gridLayoutHeaderCell(label: "Amount", width: "NARROW"),
                  a!gridLayoutHeaderCell(label: "Coins %", width: "ICON_PLUS"),
                  a!gridLayoutHeaderCell(label: "Valuation"),
                  a!gridLayoutHeaderCell(label: "Cause of Loss"),
                  a!gridLayoutHeaderCell(label: "Inflation Guard", width: "NARROW"),
                  a!gridLayoutHeaderCell(label: "DED", width: "ICON"),
                  a!gridLayoutHeaderCell(label: "BLKT#", width: "ICON_PLUS"),
                  a!gridLayoutHeaderCell(label: "Forms & Conditions to Apply", width: "WIDE"),
                  a!gridLayoutHeaderCell(label: "Action Items", width: "NARROW")
                },
                rows: a!forEach(
                  items: local!coverages,
                  expression: a!gridRowLayout(
                    contents: {
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!subjectOptions,
                        choiceValues: local!subjectOptions,
                        value: fv!item.subject,
                        saveInto: local!coverages[fv!index].subject
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.amount,
                        saveInto: local!coverages[fv!index].amount
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.coins,
                        saveInto: local!coverages[fv!index].coins
                      ),
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!valuationOptions,
                        choiceValues: local!valuationOptions,
                        value: fv!item.valuation,
                        saveInto: local!coverages[fv!index].valuation
                      ),
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!causeOptions,
                        choiceValues: local!causeOptions,
                        value: fv!item.cause,
                        saveInto: local!coverages[fv!index].cause
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.inflation,
                        saveInto: local!coverages[fv!index].inflation
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.ded,
                        saveInto: local!coverages[fv!index].ded
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.blkt,
                        saveInto: local!coverages[fv!index].blkt
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.forms,
                        saveInto: local!coverages[fv!index].forms
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(
                            icon: "files-o",
                            altText: "Duplicate",
                            color: "ACCENT",
                            linkStyle: "STANDALONE",
                            link: a!dynamicLink(
                              value: insert(local!coverages, fv!item, fv!index + 1),
                              saveInto: local!coverages
                            )
                          ),
                          char(160),
                          char(160),
                          char(160),
                          a!richTextIcon(
                            icon: "times",
                            altText: "Remove",
                            color: "NEGATIVE",
                            linkStyle: "STANDALONE",
                            showWhen: length(local!coverages) > 1,
                            link: a!dynamicLink(
                              value: remove(local!coverages, fv!index),
                              saveInto: local!coverages
                            )
                          )
                        },
                        marginBelow: "NONE"
                      )
                    }
                  )
                ),
                addRowLink: null,
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
          label: "Save",
          style: "SOLID",
          submit: true,
          loadingIndicator: true
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
    ),
    contentsWidth: "FULL",
    showButtonDivider: true
  )
)

