# Risk Exposure — UX Redesign (Final Review)

## Prepared by: Rutwik Nakkalla

---

## Overview

Two product lines redesigned within Connected Underwriting:

1. **Commercial Property** — Premises, buildings, and property coverages
2. **Commercial Automobile** — Fleet vehicles, drivers, and auto coverages

- **Live Prototype**: https://risk-exposure-page.vercel.app
- **GitHub**: https://github.com/rutwikn03/risk-exposure-page
- **Login**: 12 / 12
- **Product Switch**: Top-right dropdown in nav bar

---

## Commercial Property (Premises)

### What was built:
- Split-panel layout: left sidebar (premise navigation) + right panel (building details + coverages)
- Searchable/filterable premise list (Country, Location, Yr. Built)
- Building header with info cards (Construction Type, Roofing Yr, Year Built)
- Property Coverages table with Add/Edit/Delete
- Add Premise with smart auto-fill (reuses existing location data, suggests next building #)
- Edit Premise with structured sections
- Delete confirmation dialogs
- Sub-tabs: Risk Exposure | Loss History

### Key improvements over current:
- Premise info shown once in header, not repeated per coverage row
- Left panel gives spatial overview of all buildings
- Smart validation (integer-only, duplicate detection)
- Destructive actions protected with confirmation

---

## Commercial Automobile (Fleet)

### Page Layout
- **Left nav**: Vehicle Information | Driver Information (blue left bar for active)
- **Right pane**: Sticky toolbar (doesn't scroll) + scrollable cards/grid area
- **Sub-tabs**: Loss History | Risk Exposure (same as property)

### Vehicle Information
- **Cards view** (default, 3 per row):
  - Year Make Model + Body Type (colored tag)
  - Address with map icon
  - VIN | State | Cost New (equal spacing)
  - Coverage tags
  - Kebab menu (⋮) → Edit Details / Delete Vehicle
- **Grid view**: Table with all fields + Coverages column ("See more" to expand)
- 24 vehicles loaded for testing

### Driver Information
- **Cards view** (default, 3 per row):
  - Full Name + Sex tag
  - Address
  - License # | State | Experience
  - DOB | Hired | Yr LIC / Renewal (color-coded)
  - Kebab menu → Edit Details / Delete Driver
- **Grid view**: Table with DOB, Marital Status, Yr LIC / Renewal
- 24 drivers loaded with full data

### Toolbar (sticky)
- Title in muted gray
- ADD VEHICLE / ADD DRIVER button
- Edit Details button
- Cards/Grid toggle (inline with filter dropdowns)
- Search bar + filter dropdowns (Body Type, State LIC / Experience)

### Modals
- **Add Vehicle**: Vehicle Details + Garaging Address + Coverages tag picker (click to add/remove)
- **Add Driver**: All fields compact in one row (DOB, Marital, Exp, Hired, Yr LIC)
- **Edit Details (bulk)**: Editable grid — inline fields, delete per row with confirmation
- **Single Edit** (from card menu): Focused modal for one record
- **Delete Confirmation**: Simple dialog before any destructive action

### LIC Renewal Logic
- Yr LIC = year license was issued
- Valid for 5 years → auto-calculates remaining time
- Green: 2+ years left | Amber: 1 year left | Red: Expires this yr / Expired

---

## Design Decisions

### Why cards as default?
A card concentrates all info about one entity in a single vertical block. The user's eye stays in one place. In a grid, the same info is spread across a wide horizontal row — user has to scan left to right, often losing track with 20+ records. Cards are for scanning and acting on individual records; grid is for comparing across records.

### Why left nav instead of tabs?
Vehicles and drivers are separate entities. Persistent nav allows quick switching without losing scroll position or context.

### Why both single edit and bulk edit?
- Card menu → Edit: quick individual correction
- Top Edit button → Editable grid: mass updates across all records
- Different tasks need different tools

### Why tag-based coverages?
Auto coverages are predefined options (not free-form amounts). Tag picker is faster than filling grid rows. Visual: selected tags show what's applied at a glance.

### Why delete confirmation?
24+ records means accidental clicks are likely. One extra click prevents data loss.

---

## Consistency Between Products

| Element | Property | Automobile |
|---------|----------|------------|
| Sub-tabs style | Same | Same |
| Search bar | Same | Same |
| Filter dropdowns | Same | Same |
| Add button (SVG) | Add Premise | Add Vehicle / Add Driver |
| Edit button (SVG) | Edit Details | Edit Details |
| Modal structure | Header / Body / Footer | Same |
| Delete protection | Warning dialog | Confirmation dialog |
| Page background | #FAFAFC | Same |

---

## SAIL Interfaces Delivered

### `/sail/automobile/`
- `CA_FullPage.sail` — Complete page (data + cards + grid + nav, self-contained)
- `modal_AddVehicle.sail` — Add vehicle with coverages picker
- `modal_AddDriver.sail` — Add driver (compact layout)
- `modal_EditVehicleGrid.sail` — Editable grid with delete confirmation
- `modal_EditDriverGrid.sail` — Editable grid with delete confirmation
- `modal_DeleteConfirmation.sail` — Delete dialog

### `/sail/property/`
- `RE_FullPage.sail` — Property full page
- `modal_AddPremise.sail` — Add premise with smart auto-fill
- `modal_EditPremise.sail` — Edit premise
- `modal_DeletePremise.sail` — Delete premise
- `modal_AddCoverage.sail` — Add SOI coverage

---

## What's Next

1. Gather final review feedback
2. SAIL implementation in Appian
3. Connect to real data model
4. Loss History tab (when requirements defined)
5. Accessibility audit
