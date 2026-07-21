/*
 * Vehicle Grid - Table view with See More for coverages
 */
a!localVariables(
  local!vehicles: ri!vehicles,

  a!gridField(
    labelPosition: "COLLAPSED",
    data: local!vehicles,
    columns: {
      a!gridColumn(label: "Year, Make, Model", value: fv!row.yearMakeModel),
      a!gridColumn(label: "Body Type", value: fv!row.bodyType, width: "NARROW"),
      a!gridColumn(label: "V.I.N", value: fv!row.vin),
      a!gridColumn(label: "Address", value: fv!row.address),
      a!gridColumn(label: "State", value: fv!row.stateLic, width: "ICON_PLUS"),
      a!gridColumn(label: "Cost New", value: fv!row.costNew, width: "NARROW"),
      a!gridColumn(label: "Coverages", value: fv!row.coverages)
    },
    pageSize: 100,
    showPaging: false,
    shadeAlternateRows: false
  )
)
