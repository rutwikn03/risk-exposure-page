/* 
 * Risk Exposure - Delete Premise Confirmation Dialog
 * Aurora destructive action confirmation pattern
 * 
 * Usage: Launch as a related action or triggered from the main interface
 * Replace:
 *   - ri!premiseId → the ID of the premise to delete
 *   - ri!premiseName → display name (e.g., "Location 1 | Building 1")
 *   - saveInto on Delete → rule!RE_DeletePremise(ri!premiseId)
 */

a!localVariables(
  /* Replace with rule input in production */
  local!premiseName: "Location 1 | Building 1",
  local!premiseAddress: "42 Marine Drive, Asphalt Colony, Mumbai, Maharashtra, India, 400020",

  a!formLayout(
    label: "Delete Premise",
    contents: {
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextItem(
            text: "You are about to permanently delete ",
            size: "STANDARD"
          ),
          a!richTextItem(
            text: local!premiseName,
            size: "STANDARD",
            style: "STRONG"
          ),
          a!richTextItem(
            text: ".",
            size: "STANDARD"
          )
        },
        marginBelow: "STANDARD"
      ),
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: local!premiseAddress,
          color: "SECONDARY",
          size: "SMALL"
        ),
        marginBelow: "STANDARD"
      ),
      /* Warning banner */
      a!cardLayout(
        style: "#FFF5E6",
        showBorder: true,
        borderColor: "#D97706",
        padding: "STANDARD",
        shape: "SEMI_ROUNDED",
        contents: {
          a!sideBySideLayout(
            spacing: "STANDARD",
            alignVertical: "MIDDLE",
            items: {
              a!sideBySideItem(
                width: "MINIMIZE",
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextIcon(
                    icon: "exclamation-triangle",
                    color: "#D97706",
                    size: "MEDIUM"
                  ),
                  marginBelow: "NONE"
                )
              ),
              a!sideBySideItem(
                item: a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: a!richTextItem(
                    text: "This premise and all associated coverages will be permanently removed. This action cannot be undone.",
                    style: "STRONG"
                  ),
                  marginBelow: "NONE"
                )
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
          style: "OUTLINE",
          color: "NEGATIVE",
          submit: true,
          loadingIndicator: true
          /* saveInto: rule!RE_DeletePremise(ri!premiseId) */
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
