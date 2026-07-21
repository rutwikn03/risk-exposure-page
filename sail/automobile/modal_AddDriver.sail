/*
 * Add Driver Modal
 * Driver Details (all compact) + Address section below
 */
a!localVariables(
  local!fullName: "",
  local!sex: null,
  local!licNum: "",
  local!stateLic: null,
  local!dob: null,
  local!maritalStatus: null,
  local!yrsExp: "",
  local!dateHired: "",
  local!licYear: "",
  local!street: "",
  local!city: "",
  local!state: null,
  local!zip: "",

  a!formLayout(
    label: "Add Driver",
    contents: {
      /* Driver Details */
      a!sectionLayout(
        label: "Driver Details",
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
                  a!textField(label: "Full Name", value: local!fullName, saveInto: local!fullName, required: true, placeholder: "e.g. Marcus D. Johnson")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!dropdownField(label: "Sex", placeholder: "Select...", choiceLabels: {"Male", "Female"}, choiceValues: {"Male", "Female"}, value: local!sex, saveInto: local!sex)
                })
              }),
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!textField(label: "License Number", value: local!licNum, saveInto: local!licNum, required: true, placeholder: "Enter license number")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!dropdownField(label: "State LIC", placeholder: "Select...", choiceLabels: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, choiceValues: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, value: local!stateLic, saveInto: local!stateLic, required: true)
                })
              }),
              /* DOB, Marital, Exp, Hired, Yr LIC - all in one row */
              a!columnsLayout(columns: {
                a!columnLayout(contents: {
                  a!dateField(label: "Date of Birth", value: local!dob, saveInto: local!dob)
                }),
                a!columnLayout(contents: {
                  a!dropdownField(label: "Marital Status", placeholder: "Select...", choiceLabels: {"Single","Married","Divorced"}, choiceValues: {"Single","Married","Divorced"}, value: local!maritalStatus, saveInto: local!maritalStatus)
                }),
                a!columnLayout(contents: {
                  a!textField(label: "Yrs Experience", value: local!yrsExp, saveInto: local!yrsExp, placeholder: "e.g. 5")
                }),
                a!columnLayout(contents: {
                  a!textField(label: "Date Hired", value: local!dateHired, saveInto: local!dateHired, placeholder: "e.g. Mar 2019")
                }),
                a!columnLayout(contents: {
                  a!textField(label: "Yr LIC (issued)", value: local!licYear, saveInto: local!licYear, placeholder: "e.g. 2023")
                })
              })
            }
          )
        }
      ),

      /* Address */
      a!sectionLayout(
        label: "Address",
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
                  a!textField(label: "Street", value: local!street, saveInto: local!street, placeholder: "Enter street address")
                }),
                a!columnLayout(width: "NARROW", contents: {
                  a!dropdownField(label: "State", placeholder: "Select...", choiceLabels: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, choiceValues: {"TX","CA","IL","FL","NY","GA","CO","TN","PA","AZ"}, value: local!state, saveInto: local!state)
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
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {a!buttonWidget(label: "Add", style: "SOLID", submit: true)},
      secondaryButtons: {a!buttonWidget(label: "Cancel", style: "OUTLINE", color: "SECONDARY", validate: false, submit: true)}
    )
  )
)
