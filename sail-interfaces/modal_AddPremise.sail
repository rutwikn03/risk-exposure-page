a!localVariables(
  local!locationNum: null,
  local!buildingNum: null,
  local!street: "",
  local!city: "",
  local!state: "",
  local!country: "",
  local!zip: "",
  local!constructionType: null,
  local!roofingYear: "",
  local!yearBuilt: "",
  local!coverages: {
    a!map(subject: null, amount: "", coins: "", valuation: null, cause: null, inflation: "", ded: "", blkt: "", forms: "")
  },
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},
  local!constructionOptions: {"Frame", "Joisted Masonry", "Non Combustible", "Masonry Non Combustible", "Modified Fire Resistive", "Fire Resistive"},
  a!formLayout(
    label: "Add Premise",
    contents: {
      a!sectionLayout(
        label: "Premise Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
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
      ),
      a!sectionLayout(
        label: "Building Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
        contents: {
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!dropdownField(
                    label: "Construction Type",
                    placeholder: "Select Construction Type",
                    choiceLabels: local!constructionOptions,
                    choiceValues: local!constructionOptions,
                    value: local!constructionType,
                    saveInto: local!constructionType,
                    required: true
                  )
                }
              ),
              a!columnLayout(
                contents: {
                  a!textField(
                    label: "Bld. Improvement Roofing Yr.",
                    value: local!roofingYear,
                    saveInto: local!roofingYear,
                    required: true
                  )
                }
              ),
              a!columnLayout(
                contents: {
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
      ),
      a!sectionLayout(
        label: "Subjects of Insurance",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
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
                        icon: "clone",
                        altText: "Duplicate",
                        linkStyle: "STANDALONE",
                        link: a!dynamicLink(
                          value: insert(local!coverages, fv!item, fv!index + 1),
                          saveInto: local!coverages
                        )
                      ),
                      " ",
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
            addRowLink: a!dynamicLink(
              label: "Add Subject of Insurance",
              value: append(
                local!coverages,
                a!map(subject: null, amount: "", coins: "", valuation: null, cause: null, inflation: "", ded: "", blkt: "", forms: "")
              ),
              saveInto: local!coverages
            ),
            selectable: false
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
