/*
 * Driver Cards - 3-column card layout
 * Each card: Name + Sex tag + kebab menu
 *            Address with map icon
 *            Divider
 *            License # | State | Experience (equal spacing)
 *            DOB | Hired | Yr LIC / Renewal (inline, colored)
 */
a!localVariables(
  local!drivers: ri!drivers,
  local!currentYear: year(today()),

  a!forEach(
    items: enumerate(ceiling(count(local!drivers) / 3, 1)),
    expression: a!columnsLayout(
      columns: {
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!drivers),
          a!localVariables(
            local!d: index(local!drivers, (fv!index - 1) * 3 + 1, a!map()),
            local!yearsLeft: (tointeger(local!d.licYear) + 5) - local!currentYear,
            local!renewalText: if(local!yearsLeft < 0, "Expired", if(local!yearsLeft = 0, "Expires this yr", if(local!yearsLeft = 1, "1 yr left", tostring(local!yearsLeft) & " yrs left"))),
            local!renewalColor: if(local!yearsLeft < 1, "#991B1B", if(local!yearsLeft = 1, "#92400E", "#117C00")),
            a!cardLayout(
              contents: {
                /* Title + Sex Tag + Menu */
                a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                  a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!d.fullName, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!d.sex & " ", color: "SECONDARY", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY", linkStyle: "STANDALONE", link: a!dynamicLink()), marginBelow: "NONE"))
                }, marginBelow: "LESS"),
                /* Address */
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!d.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                /* Divider */
                a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                /* License # | State | Experience */
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "LICENSE #", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licNum, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "EXPERIENCE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.yrsExp & " yrs", style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                }, marginBelow: "LESS", spacing: "DENSE"),
                /* DOB | Hired | Yr LIC / Renewal */
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "DOB", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dob, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "HIRED", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.dateHired, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "YR LIC / RENEWAL", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!d.licYear & " · " & local!renewalText, color: local!renewalColor, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                }, marginBelow: "NONE", spacing: "DENSE")
              },
              padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF"
            )
          ),
          {}
        )),
        /* Column 2 and 3 follow same pattern - abbreviated for readability */
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!drivers), a!richTextDisplayField(labelPosition: "COLLAPSED", value: "/* Same card pattern for index (fv!index-1)*3+2 */"), {})),
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!drivers), a!richTextDisplayField(labelPosition: "COLLAPSED", value: "/* Same card pattern for index (fv!index-1)*3+3 */"), {}))
      },
      spacing: "STANDARD",
      marginBelow: "LESS"
    )
  )
)
