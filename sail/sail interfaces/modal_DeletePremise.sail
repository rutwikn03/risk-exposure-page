a!localVariables(
  local!premiseName: "Location 1 | Building 1",
  local!premiseAddress: "42 Marine Drive, Asphalt Colony, Mumbai, Maharashtra, India, 400020",
  a!formLayout(
    label: "Delete Premise",
    contents: {
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: "You are about to permanently remove:"
        ),
        marginBelow: "LESS"
      ),
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: local!premiseName,
          size: "MEDIUM",
          style: "STRONG"
        ),
        marginBelow: "NONE"
      ),
      a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: local!premiseAddress,
          color: "SECONDARY"
        ),
        marginBelow: "STANDARD"
      ),
      a!messageBanner(
        primaryText: "This premise and all associated coverages will be permanently removed. This action cannot be undone.",
        backgroundColor: "WARN",
        highlightColor: "WARN",
        icon: "exclamation-triangle"
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
