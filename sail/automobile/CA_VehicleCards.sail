/*
 * Vehicle Cards - 3-column card layout
 * Each card: Title + Body Type tag + kebab menu
 *            Address with map icon
 *            Divider
 *            VIN | State | Cost New (equal spacing)
 *            Coverage tags
 */
a!localVariables(
  local!vehicles: ri!vehicles,

  a!forEach(
    items: enumerate(ceiling(count(local!vehicles) / 3, 1)),
    expression: a!columnsLayout(
      columns: {
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 1) <= count(local!vehicles),
          a!localVariables(
            local!v: index(local!vehicles, (fv!index - 1) * 3 + 1, a!map()),
            a!cardLayout(
              contents: {
                /* Title + Body Type Tag + Menu */
                a!sideBySideLayout(
                  alignVertical: "MIDDLE",
                  items: {
                    a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                    a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                    a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY", linkStyle: "STANDALONE", link: a!dynamicLink()), marginBelow: "NONE"))
                  },
                  marginBelow: "LESS"
                ),
                /* Address */
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                /* Divider */
                a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                /* VIN | State | Cost New */
                a!columnsLayout(
                  columns: {
                    a!columnLayout(contents: {
                      a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")
                    }),
                    a!columnLayout(contents: {
                      a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")
                    }),
                    a!columnLayout(contents: {
                      a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")
                    })
                  },
                  marginBelow: "LESS",
                  spacing: "DENSE"
                ),
                /* Coverages */
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
              },
              padding: "STANDARD",
              shape: "SEMI_ROUNDED",
              showBorder: false,
              showShadow: true,
              style: "#FFFFFF"
            )
          ),
          {}
        )),
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 2) <= count(local!vehicles),
          a!localVariables(
            local!v: index(local!vehicles, (fv!index - 1) * 3 + 2, a!map()),
            a!cardLayout(
              contents: {
                a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                  a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY", linkStyle: "STANDALONE", link: a!dynamicLink()), marginBelow: "NONE"))
                }, marginBelow: "LESS"),
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                }, marginBelow: "LESS", spacing: "DENSE"),
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
              },
              padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF"
            )
          ),
          {}
        )),
        a!columnLayout(contents: if(((fv!index - 1) * 3 + 3) <= count(local!vehicles),
          a!localVariables(
            local!v: index(local!vehicles, (fv!index - 1) * 3 + 3, a!map()),
            a!cardLayout(
              contents: {
                a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                  a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.yearMakeModel, style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: " " & local!v.bodyType & " ", color: if(local!v.bodyType = "Van", "#2322F0", if(local!v.bodyType = "Truck", "#117C00", if(local!v.bodyType = "Semi", "#92400E", "#636363"))), style: "STRONG", size: "SMALL"), marginBelow: "NONE")),
                  a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextIcon(icon: "ellipsis-v", color: "SECONDARY", linkStyle: "STANDALONE", link: a!dynamicLink()), marginBelow: "NONE"))
                }, marginBelow: "LESS"),
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextIcon(icon: "map-marker", color: "SECONDARY"), a!richTextItem(text: " " & local!v.address, color: "SECONDARY", size: "SMALL")}, marginBelow: "LESS"),
                a!horizontalLine(marginBelow: "LESS", color: "#F0F0F5"),
                a!columnsLayout(columns: {
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "VIN", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.vin, style: "STRONG", size: "SMALL")}, marginBelow: "NONE")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "STATE", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.stateLic, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "CENTER")}),
                  a!columnLayout(contents: {a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(text: "COST NEW", color: "SECONDARY", size: "SMALL"), char(10), a!richTextItem(text: local!v.costNew, style: "STRONG", size: "SMALL")}, marginBelow: "NONE", align: "RIGHT")})
                }, marginBelow: "LESS", spacing: "DENSE"),
                a!richTextDisplayField(labelPosition: "COLLAPSED", value: a!richTextItem(text: local!v.coverages, size: "SMALL", color: "ACCENT"), marginBelow: "NONE")
              },
              padding: "STANDARD", shape: "SEMI_ROUNDED", showBorder: false, showShadow: true, style: "#FFFFFF"
            )
          ),
          {}
        ))
      },
      spacing: "STANDARD",
      marginBelow: "LESS"
    )
  )
)
