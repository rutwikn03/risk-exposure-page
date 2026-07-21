a!localVariables(
  local!firstName: "Marcus D.",
  local!lastName: "Johnson",
  local!sex: "Male",
  local!dateOfBirth: date(1982, 9, 14),
  local!maritalStatus: "Married",
  local!driversLicense: "3849 2918 8291",
  local!stateLic: "TX",
  local!yrLicensed: 2012,
  local!yrsExperience: 12,
  local!dateHired: date(2019, 3, 15),
  local!street: "1847 Elm Creek Dr",
  local!city: "Arlington",
  local!state: "TX",
  local!zip: "76011",
  local!country: "United States",
  local!sexOptions: {"Male", "Female"},
  local!maritalOptions: {"Single", "Married", "Divorced", "Widowed"},
  a!formLayout(
    label: "Edit Driver",
    contents: {
      /* Personal Information (left) + License & Employment (right) */
      a!columnsLayout(
        columns: {
          /* LEFT: Personal Information */
          a!columnLayout(
            contents: {
              a!sectionLayout(
                label: "Personal Information",
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
                        label: "First Name",
                        value: local!firstName,
                        saveInto: local!firstName,
                        required: true
                      ),
                      a!textField(
                        label: "Last Name",
                        value: local!lastName,
                        saveInto: local!lastName,
                        required: true
                      ),
                      a!dropdownField(
                        label: "Sex",
                        placeholder: "Select",
                        choiceLabels: local!sexOptions,
                        choiceValues: local!sexOptions,
                        value: local!sex,
                        saveInto: local!sex,
                        required: true
                      ),
                      a!dateField(
                        label: "Date of Birth",
                        value: local!dateOfBirth,
                        saveInto: local!dateOfBirth,
                        required: true
                      ),
                      a!dropdownField(
                        label: "Marital Status",
                        placeholder: "Select",
                        choiceLabels: local!maritalOptions,
                        choiceValues: local!maritalOptions,
                        value: local!maritalStatus,
                        saveInto: local!maritalStatus,
                        required: true
                      )
                    }
                  )
                }
              )
            }
          ),
          /* RIGHT: License & Employment */
          a!columnLayout(
            contents: {
              a!sectionLayout(
                label: "License & Employment",
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
                        label: "Drivers License # / SSN",
                        value: local!driversLicense,
                        saveInto: local!driversLicense,
                        required: true
                      ),
                      a!textField(
                        label: "State LIC",
                        value: local!stateLic,
                        saveInto: local!stateLic,
                        required: true
                      ),
                      a!integerField(
                        label: "Yr. Licensed",
                        value: local!yrLicensed,
                        saveInto: local!yrLicensed,
                        required: true
                      ),
                      a!integerField(
                        label: "Yrs. Experience",
                        value: local!yrsExperience,
                        saveInto: local!yrsExperience,
                        required: true
                      ),
                      a!dateField(
                        label: "Date Hired",
                        value: local!dateHired,
                        saveInto: local!dateHired,
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
      /* Address - full width below */
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
                        label: "Zip Code",
                        value: local!zip,
                        saveInto: local!zip,
                        required: true
                      )
                    }
                  )
                }
              ),
              a!textField(
                label: "Country",
                value: local!country,
                saveInto: local!country,
                required: true
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
          label: "Delete Driver",
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
