/*
 * Delete Confirmation Dialog
 * Simple modal: title, message, Cancel + Delete buttons
 * Parameters: ri!itemName (Text), ri!itemType (Text: "Vehicle" or "Driver")
 */
a!localVariables(
  local!itemName: ri!itemName,
  local!itemType: ri!itemType,

  a!formLayout(
    label: "Delete " & local!itemType,
    contents: {
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextItem(text: "Are you sure you want to delete "),
          a!richTextItem(text: local!itemName, style: "STRONG"),
          a!richTextItem(text: "?")
        },
        marginBelow: "STANDARD"
      ),
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: "This action cannot be undone.",
          color: "SECONDARY",
          size: "SMALL"
        ),
        marginBelow: "NONE"
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {
        a!buttonWidget(
          label: "Delete",
          style: "SOLID",
          color: "NEGATIVE",
          submit: true
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
