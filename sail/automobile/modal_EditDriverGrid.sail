/*
 * Edit Driver Details - Editable Grid (Appian a!gridLayout)
 * Inline editing for all driver fields with delete action per row
 */
a!localVariables(
  local!drivers: ri!drivers,
  local!confirmDeleteIndex: null,

  a!formLayout(
    label: "Edit Driver Details",
    contents: {
      a!gridLayout(
        labelPosition: "COLLAPSED",
        headerCells: {
          a!gridLayoutHeaderCell(label: "Full Name"),
          a!gridLayoutHeaderCell(label: "Sex", width: "ICON_PLUS"),
          a!gridLayoutHeaderCell(label: "DOB", width: "NARROW"),
          a!gridLayoutHeaderCell(label: "Marital", width: "NARROW"),
          a!gridLayoutHeaderCell(label: "License #"),
          a!gridLayoutHeaderCell(label: "State", width: "ICON_PLUS"),
          a!gridLayoutHeaderCell(label: "Exp", width: "ICON_PLUS"),
          a!gridLayoutHeaderCell(label: "Date Hired", width: "NARROW"),
          a!gridLayoutHeaderCell(label: "Address"),
          a!gridLayoutHeaderCell(label: "Yr LIC", width: "ICON_PLUS"),
          a!gridLayoutHeaderCell(label: "", width: "ICON")
        },
        rows: a!forEach(
          items: local!drivers,
          expression: a!gridRowLayout(
            contents: {
              a!textField(labelPosition: "COLLAPSED", value: fv!item.fullName, saveInto: local!drivers[fv!index].fullName),
              a!dropdownField(labelPosition: "COLLAPSED", choiceLabels: {"Male","Female"}, choiceValues: {"Male","Female"}, value: fv!item.sex, saveInto: local!drivers[fv!index].sex),
              a!dateField(labelPosition: "COLLAPSED", value: fv!item.dob, saveInto: local!drivers[fv!index].dob),
              a!dropdownField(labelPosition: "COLLAPSED", placeholder: "-", choiceLabels: {"Single","Married","Divorced"}, choiceValues: {"Single","Married","Divorced"}, value: fv!item.maritalStatus, saveInto: local!drivers[fv!index].maritalStatus),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.licNum, saveInto: local!drivers[fv!index].licNum),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.stateLic, saveInto: local!drivers[fv!index].stateLic),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.yrsExp, saveInto: local!drivers[fv!index].yrsExp),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.dateHired, saveInto: local!drivers[fv!index].dateHired),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.address, saveInto: local!drivers[fv!index].address),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.licYear, saveInto: local!drivers[fv!index].licYear, placeholder: "e.g. 2023"),
              a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: a!richTextIcon(icon: "trash-o", color: "ACCENT", linkStyle: "STANDALONE", link: a!dynamicLink(value: fv!index, saveInto: local!confirmDeleteIndex)),
                marginBelow: "NONE"
              )
            }
          )
        ),
        selectable: false,
        addRowLink: null
      ),

      /* Delete Confirmation */
      if(
        isnull(local!confirmDeleteIndex),
        {},
        a!cardLayout(
          style: "#FEF2F2",
          showBorder: true,
          borderColor: "#991B1B",
          shape: "SEMI_ROUNDED",
          padding: "STANDARD",
          marginAbove: "STANDARD",
          contents: {
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(text: "Are you sure you want to delete ", size: "SMALL"),
                a!richTextItem(text: index(local!drivers, local!confirmDeleteIndex, a!map()).fullName, style: "STRONG", size: "SMALL"),
                a!richTextItem(text: "? This action cannot be undone.", size: "SMALL")
              },
              marginBelow: "STANDARD"
            ),
            a!buttonArrayLayout(
              buttons: {
                a!buttonWidget(label: "Cancel", size: "SMALL", style: "OUTLINE", saveInto: a!save(local!confirmDeleteIndex, null)),
                a!buttonWidget(label: "Delete", size: "SMALL", style: "SOLID", color: "NEGATIVE", saveInto: {a!save(local!drivers, remove(local!drivers, local!confirmDeleteIndex)), a!save(local!confirmDeleteIndex, null)})
              },
              align: "END"
            )
          }
        )
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {a!buttonWidget(label: "Save", style: "SOLID", submit: true)},
      secondaryButtons: {a!buttonWidget(label: "Cancel", style: "OUTLINE", color: "SECONDARY", validate: false, submit: true)}
    )
  )
)
