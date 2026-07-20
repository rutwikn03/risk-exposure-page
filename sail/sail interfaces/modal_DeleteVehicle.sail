a!localVariables(
  a!formLayout(
    label: "Delete Vehicle",
    contents: {
      a!cardLayout(
        style: "#F5F5F7",
        showBorder: true,
        borderColor: "#EDEEFA",
        shape: "SEMI_ROUNDED",
        padding: "STANDARD",
        marginBelow: "STANDARD",
        contents: {
          a!columnsLayout(
            columns: {
              a!columnLayout(
                width: "MINIMIZE",
                contents: {
                  a!stampField(
                    icon: "exclamation-triangle",
                    backgroundColor: "#FEE2E2",
                    contentColor: "#991B1B",
                    size: "MEDIUM"
                  )
                }
              ),
              a!columnLayout(
                contents: {
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: a!richTextItem(
                      text: "Are you sure you want to delete this vehicle?",
                      style: "STRONG",
                      size: "MEDIUM"
                    ),
                    marginBelow: "LESS"
                  ),
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: a!richTextItem(
                      text: "This action cannot be undone. All coverages associated with this vehicle will also be removed.",
                      color: "SECONDARY"
                    ),
                    marginBelow: "NONE"
                  )
                }
              )
            }
          )
        }
      )
    },
    buttons: a!buttonLayout(
      primaryButtons: {
        a!buttonWidget(
          label: "Delete",
          style: "SOLID",
          color: "NEGATIVE",
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
    showButtonDivider: true
  )
)
