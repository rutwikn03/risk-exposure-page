a!localVariables(
  local!premiseName: "Location 1 | Building 1",
  local!premiseAddress: "42 Marine Drive, Asphalt Colony, Mumbai, Maharashtra, India, 400020",
  local!constructionType: "Non Combustible",
  local!roofingYear: "2018",
  local!yearBuilt: "1997",
  local!coverages: {
    a!map(subject: null, amount: "", coins: "", valuation: null, cause: null, inflation: "", ded: "", blkt: "", forms: "")
  },
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},
  a!formLayout(
    label: "Add Subject of Insurance",
    contents: {
      a!sectionLayout(
        label: "Premise Details",
        labelSize: "SMALL",
        labelColor: "SECONDARY",
        contents: {
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: local!premiseName,
              size: "MEDIUM_PLUS",
              style: "STRONG"
            ),
            marginBelow: "NONE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: local!premiseAddress,
              color: "SECONDARY",
              size: "SMALL"
            ),
            marginBelow: "STANDARD"
          ),
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!sideBySideLayout(
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
                            value: a!richTextItem(text: local!constructionType, size: "SMALL"),
                            marginBelow: "NONE"
                          )
                        }
                      )
                    }
                  )
                }
              ),
              a!columnLayout(
                contents: {
                  a!sideBySideLayout(
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
                            value: a!richTextItem(text: "Roofing Year", style: "STRONG", size: "SMALL"),
                            marginBelow: "NONE"
                          ),
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: a!richTextItem(text: local!roofingYear, size: "SMALL"),
                            marginBelow: "NONE"
                          )
                        }
                      )
                    }
                  )
                }
              ),
              a!columnLayout(
                contents: {
                  a!sideBySideLayout(
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
                            value: a!richTextItem(text: local!yearBuilt, size: "SMALL"),
                            marginBelow: "NONE"
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
