a!localVariables(
  local!premiseName: "Location 1 | Building 1",
  local!premiseAddress: "42 Marine Drive, Asphalt Colony, Mumbai, Maharashtra, India, 400020",
  a!formLayout(
    label: "Delete Premise",
    contents: {
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextItem(text: "You are about to permanently delete "),
          a!richTextItem(text: local!premiseName, style: "STRONG"),
          a!richTextItem(text: ".")
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
      a!stampField(
        labelPosition: "COLLAPSED",
        icon: "exclamation-triangle",
        backgroundColor: "#FFF5E6",
        contentColor: "#D97706",
        size: "MEDIUM",
        align: "CENTER",
        marginBelow: "STANDARD"
      ),
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: "This premise and all associated coverages will be permanently removed. This action cannot be undone.",
          color: "NEGATIVE",
          style: "STRONG"
        ),
        align: "CENTER"
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
    )
  )
)
