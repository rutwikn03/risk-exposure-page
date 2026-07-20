a!localVariables(
  local!firstName: "",
  local!lastName: "",
  local!sex: null,
  local!dateOfBirth: null,
  local!maritalStatus: null,
  local!driversLicense: "",
  local!stateLic: "",
  local!yrLicensed: null,
  local!yrsExperience: null,
  local!dateHired: null,
  local!street: "",
  local!city: "",
  local!state: "",
  local!zip: "",
  local!country: "",
  local!sexOptions: {"Male", "Female"},
  local!maritalOptions: {"Single", "Married", "Divorced", "Widowed"},
  a!formLayout(
    label: "Add Driver",
    contents: {
      /* Personal Information (left) + License & Employment (right) side by side */
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
          label: "Add Driver",
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
