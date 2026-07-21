/*
 * Add Vehicle Modal
 * Vehicle Details + Garaging Address + Coverages (tag picker)
 */
a!localVariables(
  local!yearMakeModel: "",
  local!bodyType: null,
  local!vin: "",
  local!costNew: "",
  local!street: "",
  local!city: "",
  local!state: null,
  local!zip: "",
  local!selectedCoverages: {},
  local!allCoverages: {"Liability-BI", "Liability-PD", "Collision", "Comprehensive", "Cargo", "Uninsured", "Underinsured", "Medical Payments", "Personal Injury", "Rental Reimbursement", "Towing", "Gap Coverage"},

  a!formLayout(
    label: "Add Vehicle",
    contents: {
      /* Vehicle Details */
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
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!textField(label: "Year, Make, Model", value: local!yearMakeModel, saveInto: local!yearMakeModel, required: true, placeholder: "e.g. 2024 Ford Transit 250")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!dropdownField(label: "Body Type", placeholder: "Select...", choiceLabels: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, choiceValues: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, value: local!bodyType, saveInto: local!bodyType, required: true)
                })
              }),
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!textField(label: "V.I.N", value: local!vin, saveInto: local!vin, required: true, placeholder: "Enter VIN")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!textField(label: "Cost New", value: local!costNew, saveInto: local!costNew, placeholder: "$0.00")
                })
              })
            }
          )
        }
      ),

      /* Garaging Address */
      a!sectionLayout(
        label: "Garaging Address",
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
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!textField(label: "Street Address", value: local!street, saveInto: local!street, required: true, placeholder: "Enter street address")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!dropdownField(label: "State LIC", placeholder: "Select...", choiceLabels: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, choiceValues: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, value: local!state, saveInto: local!state, required: true)
                })
              }),
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!textField(label: "City", value: local!city, saveInto: local!city, placeholder: "Enter city")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!textField(label: "Zip Code", value: local!zip, saveInto: local!zip, placeholder: "Enter zip")
                })
              })
            }
          )
        }
      ),

      /* Coverages */
      a!sectionLayout(
        label: "Coverages",
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
              /* Selected coverages display */
              a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: if(
                  count(local!selectedCoverages) = 0,
                  a!richTextItem(text: "Click coverages below to add them", color: "SECONDARY", size: "SMALL"),
                  a!forEach(
                    items: local!selectedCoverages,
                    expression: a!richTextItem(text: " " & fv!item & " ✕ ", color: "ACCENT", style: "STRONG", size: "SMALL", link: a!dynamicLink(value: remove(local!selectedCoverages, fv!index), saveInto: local!selectedCoverages))
                  )
                ),
                marginBelow: "STANDARD"
              ),
              /* Available coverages */
              a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: a!forEach(
                  items: local!allCoverages,
                  expression: a!richTextItem(
                    text: " " & fv!item & " ",
                    color: if(contains(local!selectedCoverages, fv!item), "ACCENT", "SECONDARY"),
                    style: if(contains(local!selectedCoverages, fv!item), "STRONG", "PLAIN"),
                    size: "SMALL",
                    link: a!dynamicLink(
                      value: if(contains(local!selectedCoverages, fv!item), remove(local!selectedCoverages, wherecontains(fv!item, local!selectedCoverages)), append(local!selectedCoverages, fv!item)),
                      saveInto: local!selectedCoverages
                    )
                  )
                ),
                marginBelow: "NONE"
              )
            }
          )
        }
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {a!buttonWidget(label: "Add", style: "SOLID", submit: true)},
      secondaryButtons: {a!buttonWidget(label: "Cancel", style: "OUTLINE", color: "SECONDARY", validate: false, submit: true)}
    )
  )
)
