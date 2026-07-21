/*
 * Edit Vehicle Details - Editable Grid (Appian a!gridLayout)
 * Inline editing for all vehicle fields with delete action per row
 */
a!localVariables(
  local!vehicles: ri!vehicles,
  local!confirmDeleteIndex: null,

  a!formLayout(
    label: "Edit Vehicle Details",
    contents: {
      a!gridLayout(
        labelPosition: "COLLAPSED",
        headerCells: {
          a!gridLayoutHeaderCell(label: "Year, Make, Model"),
          a!gridLayoutHeaderCell(label: "Body Type", width: "NARROW"),
          a!gridLayoutHeaderCell(label: "V.I.N"),
          a!gridLayoutHeaderCell(label: "Address"),
          a!gridLayoutHeaderCell(label: "State", width: "ICON_PLUS"),
          a!gridLayoutHeaderCell(label: "Cost New", width: "NARROW"),
          a!gridLayoutHeaderCell(label: "", width: "ICON")
        },
        rows: a!forEach(
          items: local!vehicles,
          expression: a!gridRowLayout(
            contents: {
              a!textField(labelPosition: "COLLAPSED", value: fv!item.yearMakeModel, saveInto: local!vehicles[fv!index].yearMakeModel),
              a!dropdownField(labelPosition: "COLLAPSED", choiceLabels: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, choiceValues: {"Van","Truck","Sedan","SUV","Semi","Box Truck"}, value: fv!item.bodyType, saveInto: local!vehicles[fv!index].bodyType),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.vin, saveInto: local!vehicles[fv!index].vin),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.address, saveInto: local!vehicles[fv!index].address),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.stateLic, saveInto: local!vehicles[fv!index].stateLic),
              a!textField(labelPosition: "COLLAPSED", value: fv!item.costNew, saveInto: local!vehicles[fv!index].costNew),
              a!richTextDisplayField(
                labelPosition: "COLLAPSED",
                value: a!richTextIcon(
                  icon: "trash-o",
                  color: "ACCENT",
                  linkStyle: "STANDALONE",
                  link: a!dynamicLink(value: fv!index, saveInto: local!confirmDeleteIndex)
                ),
                marginBelow: "NONE"
              )
            }
          )
        ),
        selectable: false,
        addRowLink: null
      ),

      /* Delete Confirmation inline */
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
                a!richTextItem(text: index(local!vehicles, local!confirmDeleteIndex, a!map()).yearMakeModel, style: "STRONG", size: "SMALL"),
                a!richTextItem(text: "? This action cannot be undone.", size: "SMALL")
              },
              marginBelow: "STANDARD"
            ),
            a!buttonArrayLayout(
              buttons: {
                a!buttonWidget(label: "Cancel", size: "SMALL", style: "OUTLINE", saveInto: a!save(local!confirmDeleteIndex, null)),
                a!buttonWidget(label: "Delete", size: "SMALL", style: "SOLID", color: "NEGATIVE", saveInto: {a!save(local!vehicles, remove(local!vehicles, local!confirmDeleteIndex)), a!save(local!confirmDeleteIndex, null)})
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
