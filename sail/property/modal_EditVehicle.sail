a!localVariables(
  local!year: "2024",
  local!make: "Ford",
  local!model: "Transit 250",
  local!vin: "1FTBW2CM5RKA48291",
  local!bodyType: "Van",
  local!street: "4820 Industrial Blvd",
  local!city: "Arlington",
  local!state: "TX",
  local!zip: "76017",
  local!stateLic: "TX-8291-CVA",
  local!costNew: "$52,400.00",
  local!coverages: {
    a!map(coverageType: "Liability - Bodily Injury", limit: "$1,000,000", deductible: "$0", premium: "$1,840"),
    a!map(coverageType: "Liability - Property Damage", limit: "$500,000", deductible: "$0", premium: "$1,220"),
    a!map(coverageType: "Collision", limit: "$52,400", deductible: "$1,000", premium: "$680"),
    a!map(coverageType: "Comprehensive", limit: "$52,400", deductible: "$500", premium: "$420")
  },
  local!bodyTypeOptions: {"Sedan", "SUV", "Van", "Truck", "Semi", "Box Truck"},
  local!coverageTypeOptions: {"Liability - Bodily Injury", "Liability - Property Damage", "Collision", "Comprehensive", "Uninsured Motorist", "Cargo Coverage", "Roadside Assistance"},
  a!formLayout(
    label: "Edit Vehicle",
    contents: {
      /* Vehicle Details (left) + Garaging & Financial (right) side by side */
      a!columnsLayout(
        columns: {
          /* LEFT: Vehicle Details */
          a!columnLayout(
            contents: {
              a!sectionLayout(
                label: "Vehicle Details",
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
                      a!textField(
                        label: "Year",
                        value: local!year,
                        saveInto: local!year,
                        required: true
                      ),
                      a!textField(
                        label: "Make",
                        value: local!make,
                        saveInto: local!make,
                        required: true
                      ),
                      a!textField(
                        label: "Model",
                        value: local!model,
                        saveInto: local!model,
                        required: true
                      ),
                      a!textField(
                        label: "V.I.N",
                        value: local!vin,
                        saveInto: local!vin,
                        required: true,
                        placeholder: "17-character VIN"
                      ),
                      a!dropdownField(
                        label: "Body Type",
                        placeholder: "Select Body Type",
                        choiceLabels: local!bodyTypeOptions,
                        choiceValues: local!bodyTypeOptions,
                        value: local!bodyType,
                        saveInto: local!bodyType,
                        required: true
                      )
                    }
                  )
                }
              )
            }
          ),
          /* RIGHT: Garaging & Financial */
          a!columnLayout(
            contents: {
              a!sectionLayout(
                label: "Garaging & Financial",
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
                      a!textField(
                        label: "Street Address",
                        value: local!street,
                        saveInto: local!street,
                        required: true
                      ),
                      a!textField(
                        label: "City",
                        value: local!city,
                        saveInto: local!city,
                        required: true
                      ),
                      a!textField(
                        label: "State",
                        value: local!state,
                        saveInto: local!state,
                        required: true
                      ),
                      a!textField(
                        label: "Zip Code",
                        value: local!zip,
                        saveInto: local!zip,
                        required: true
                      ),
                      a!textField(
                        label: "State LIC",
                        value: local!stateLic,
                        saveInto: local!stateLic,
                        required: true
                      ),
                      a!textField(
                        label: "Cost New",
                        value: local!costNew,
                        saveInto: local!costNew,
                        required: true,
                        placeholder: "$0.00"
                      )
                    }
                  )
                }
              )
            }
          )
        }
      ),
      /* Coverages - full width below */
      a!sectionLayout(
        label: "",
        contents: {
          /* Header: Title + Add button inline */
          a!sideBySideLayout(
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "Coverages",
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
                          a!map(coverageType: null, limit: "", deductible: "", premium: "")
                        ),
                        saveInto: local!coverages
                      )
                    ),
                    " ",
                    a!richTextItem(
                      text: "Add Coverage",
                      color: "ACCENT",
                      style: "STRONG",
                      link: a!dynamicLink(
                        value: append(
                          local!coverages,
                          a!map(coverageType: null, limit: "", deductible: "", premium: "")
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
          /* Gray box with grid */
          a!cardLayout(
            height: "MEDIUM_PLUS",
            style: "#F5F5F7",
            showBorder: true,
            borderColor: "#EDEEFA",
            shape: "SEMI_ROUNDED",
            padding: "STANDARD",
            contents: {
              a!gridLayout(
                labelPosition: "COLLAPSED",
                headerCells: {
                  a!gridLayoutHeaderCell(label: "Coverage Type"),
                  a!gridLayoutHeaderCell(label: "Limit"),
                  a!gridLayoutHeaderCell(label: "Deductible"),
                  a!gridLayoutHeaderCell(label: "Premium"),
                  a!gridLayoutHeaderCell(label: "Actions", width: "NARROW")
                },
                rows: a!forEach(
                  items: local!coverages,
                  expression: a!gridRowLayout(
                    contents: {
                      a!dropdownField(
                        labelPosition: "COLLAPSED",
                        placeholder: "Select",
                        choiceLabels: local!coverageTypeOptions,
                        choiceValues: local!coverageTypeOptions,
                        value: fv!item.coverageType,
                        saveInto: local!coverages[fv!index].coverageType
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.limit,
                        saveInto: local!coverages[fv!index].limit
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.deductible,
                        saveInto: local!coverages[fv!index].deductible
                      ),
                      a!textField(
                        labelPosition: "COLLAPSED",
                        value: fv!item.premium,
                        saveInto: local!coverages[fv!index].premium
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
          label: "Save Changes",
          style: "SOLID",
          submit: true,
          loadingIndicator: true
        )
      },
      secondaryButtons: {
        a!buttonWidget(
          label: "Delete Vehicle",
          icon: "trash-o",
          style: "LINK",
          color: "NEGATIVE",
          submit: true,
          loadingIndicator: true
        ),
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
