/* 
 * Risk Exposure - Add Premise Form (Record Action Dialog)
 * Smart auto-fill: Existing location populates address fields
 * Building number validation: Prevents duplicates, suggests next available
 * Aurora Design System compliant
 * 
 * Replace:
 *   - local!existingPremises → rule!RE_GetAllPremises()
 *   - saveInto on Submit → write new premise + coverages to data store
 */

a!localVariables(
  /* Existing premises for validation - replace with actual query */
  local!existingPremises: {
    a!map(id: 1, location: "Location 1", building: "Building 1", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020"),
    a!map(id: 2, location: "Location 1", building: "Building 2", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020"),
    a!map(id: 3, location: "Location 1", building: "Building 3", street: "42 Marine Drive, Asphalt Colony", city: "Mumbai", state: "Maharashtra", country: "India", zip: "400020"),
    a!map(id: 4, location: "Location 2", building: "Building 1", street: "742 Lexington Avenue, Manhattan", city: "New York", state: "New York", country: "USA", zip: "10022"),
    a!map(id: 5, location: "Location 2", building: "Building 2", street: "742 Lexington Avenue, Manhattan", city: "New York", state: "New York", country: "USA", zip: "10022")
  },

  /* Form fields */
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

  /* Coverages */
  local!coverages: {
    a!map(id: 1, subject: "", amount: "", coins: "", valuation: "", cause: "", inflation: "", ded: "", blkt: "", forms: "")
  },

  /* Dropdown options */
  local!subjectOptions: {"Building", "Business Personal Property", "Business Income with Extra Expense", "Extra Expense", "Furniture & Fixtures", "Machinery Equipment", "Personal Property"},
  local!valuationOptions: {"Actual Cash Value", "Replacement Cost", "Agreed Amount", "Market Value"},
  local!causeOptions: {"Basic", "Broad", "Earthquake", "Special Excluding Theft"},
  local!constructionOptions: {"Frame", "Joisted Masonry", "Non Combustible", "Masonry Non Combustible", "Modified Fire Resistive", "Fire Resistive"},

  /* Derived: auto-fill logic */
  local!matchingLocation: if(
    isnull(local!locationNum),
    {},
    index(
      local!existingPremises,
      where(
        a!forEach(
          items: local!existingPremises,
          expression: fv!item.location = "Location " & local!locationNum
        )
      ),
      {}
    )
  ),

  local!locationExists: length(local!matchingLocation) > 0,

  /* Next available building number */
  local!existingBuildingNums: if(
    local!locationExists,
    a!forEach(
      items: local!matchingLocation,
      expression: tointeger(
        substitute(fv!item.building, "Building ", "")
      )
    ),
    {}
  ),
  local!nextBuildingNum: if(
    local!locationExists,
    max(local!existingBuildingNums) + 1,
    1
  ),

  /* Building duplicate validation */
  local!buildingExists: if(
    and(not(isnull(local!buildingNum)), local!locationExists),
    contains(local!existingBuildingNums, local!buildingNum),
    false
  ),

  a!formLayout(
    label: "Add Premise",
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
                      saveInto: {
                        local!locationNum,
                        /* Auto-fill address if location exists */
                        if(
                          length(local!matchingLocation) > 0,
                          {
                            a!save(local!street, index(local!matchingLocation, 1, a!map()).street),
                            a!save(local!city, index(local!matchingLocation, 1, a!map()).city),
                            a!save(local!state, index(local!matchingLocation, 1, a!map()).state),
                            a!save(local!country, index(local!matchingLocation, 1, a!map()).country),
                            a!save(local!zip, index(local!matchingLocation, 1, a!map()).zip),
                            a!save(local!buildingNum, local!nextBuildingNum)
                          },
                          {
                            a!save(local!street, ""),
                            a!save(local!city, ""),
                            a!save(local!state, ""),
                            a!save(local!country, ""),
                            a!save(local!zip, ""),
                            a!save(local!buildingNum, null)
                          }
                        )
                      },
                      required: true,
                      instructions: if(
                        local!locationExists,
                        "Location found — address auto-populated",
                        ""
                      )
                    )
                  ),
                  a!columnLayout(
                    width: "NARROW",
                    contents: a!integerField(
                      label: "Building #",
                      value: local!buildingNum,
                      saveInto: local!buildingNum,
                      required: true,
                      validations: if(
                        local!buildingExists,
                        "A building with this number already exists for Location " & local!locationNum & ". Next available: " & local!nextBuildingNum,
                        {}
                      ),
                      instructions: if(
                        and(not(isnull(local!buildingNum)), not(local!buildingExists), local!locationExists),
                        "This is the next available number",
                        ""
                      )
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
                required: true,
                readOnly: false
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
          /* Section header */
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
                        placeholder: "Enter value",
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
                        placeholder: "Enter value",
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
                        placeholder: "Enter value",
                        value: fv!item.forms,
                        saveInto: local!coverages[fv!index].forms
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
                                caption: "Remove",
                                color: "NEGATIVE",
                                linkStyle: "STANDALONE",
                                showWhen: count(local!coverages) > 1,
                                link: a!dynamicLink(
                                  value: remove(local!coverages, fv!index),
                                  saveInto: local!coverages
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
          loadingIndicator: true,
          disabled: local!buildingExists
          /* saveInto: write new premise + coverages to data store */
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
