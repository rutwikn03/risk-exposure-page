/*
 * Driver Grid - Table view with Yr LIC / Renewal combined column
 */
a!localVariables(
  local!drivers: ri!drivers,
  local!currentYear: year(today()),

  a!gridField(
    labelPosition: "COLLAPSED",
    data: local!drivers,
    columns: {
      a!gridColumn(label: "Full Name", value: fv!row.fullName),
      a!gridColumn(label: "Sex", value: fv!row.sex, width: "ICON_PLUS"),
      a!gridColumn(label: "DOB", value: fv!row.dob, width: "NARROW"),
      a!gridColumn(label: "Marital Status", value: fv!row.maritalStatus, width: "NARROW"),
      a!gridColumn(label: "License #", value: fv!row.licNum),
      a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"),
      a!gridColumn(label: "Experience", value: fv!row.yrsExp & " yrs", width: "NARROW"),
      a!gridColumn(label: "Date Hired", value: fv!row.dateHired, width: "NARROW"),
      a!gridColumn(
        label: "Yr LIC / Renewal",
        value: a!localVariables(
          local!yearsLeft: (tointeger(fv!row.licYear) + 5) - local!currentYear,
          local!renewalText: if(local!yearsLeft < 0, "Expired", if(local!yearsLeft = 0, "Expires this yr", if(local!yearsLeft = 1, "1 yr left", tostring(local!yearsLeft) & " yrs left"))),
          local!renewalColor: if(local!yearsLeft < 1, "#991B1B", if(local!yearsLeft = 1, "#92400E", "#117C00")),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: a!richTextItem(
              text: fv!row.licYear & " · " & local!renewalText,
              color: local!renewalColor,
              style: "STRONG"
            ),
            marginBelow: "NONE"
          )
        )
      )
    },
    pageSize: 100,
    showPaging: false,
    shadeAlternateRows: false
  )
)
