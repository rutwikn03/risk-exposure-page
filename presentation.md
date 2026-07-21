# Risk Exposure — UX Redesign (Full Review)

## Prepared by: Rutwik Nakkalla
## For: Final Design Review

---

## Overview

This project covers **two product lines** within the Connected Underwriting platform:

1. **Commercial Property** — Premises, buildings, and property coverages
2. **Commercial Automobile** — Fleet vehicles, drivers, and auto coverages

Both share the same top-level chrome (nav, header, tabs) and design system (Aurora-compliant), but diverge in content structure and workflow.

- **Live Prototype**: https://risk-exposure-page.vercel.app (or localhost:3000)
- **GitHub**: https://github.com/rutwikn03/risk-exposure-page
- **Login**: 12 / 12
- **Product Switch**: Top-right dropdown in nav bar

---

## Part 1: Commercial Property (Premises)

### What was built:
- Split-panel layout: left sidebar (premise list) + right panel (building details + coverages)
- Searchable/filterable premise navigation (Country, Location, Yr. Built filters)
- Violet header with building info cards (Construction Type, Roofing Yr, Year Built)
- Property Coverages table with Add/Edit/Delete actions
- Add Premise modal with smart auto-fill (existing location data reused, next building # suggested)
- Edit Premise modal with structured sections
- Delete confirmation dialogs
- Sub-tabs: Risk Exposure (active) | Loss History (placeholder)

### Design decisions:
- Premise info shown ONCE in header, not repeated per coverage row
- Left panel gives spatial overview of all buildings
- Smart validation (integer-only, duplicate building detection)
- Aurora-compliant colors, typography, cards

---

## Part 2: Commercial Automobile (Fleet)

### What was built:

#### Main Page Layout
- **Left nav pane**: Vehicle Information | Driver Information (text-only, blue left bar for active state)
- **Right content pane**: Sticky toolbar + scrollable cards/grid area
- **Background**: `#FAFAFC` throughout right pane
- **Sub-tabs**: Loss History | Risk Exposure (same style as property page)

#### Vehicle Information
- **Cards view** (default, 3 per row):
  - Title: Year Make Model + Body Type colored tag
  - Address with map pin icon
  - Divider
  - Meta row: VIN (left) | State (center) | Cost New (right) — equal spacing
  - Coverage tags at bottom (blue accent)
  - Kebab menu (⋮) → Edit Details / Delete Vehicle
- **Grid view**: Table with columns including Coverages ("See more" expand link)
- **24 vehicles** loaded for edge case testing

#### Driver Information
- **Cards view** (default, 3 per row):
  - Title: Full Name + Sex tag
  - Address with map pin
  - Divider
  - Meta row 1: License # | State | Experience
  - Meta row 2: DOB | Hired | Yr LIC / Renewal (color-coded)
  - Kebab menu → Edit Details / Delete Driver
- **Grid view**: Table with DOB, Marital Status, Yr LIC / Renewal columns
- **24 drivers** loaded with DOB, marital status, license year data

#### Toolbar (sticky, doesn't scroll)
- Title ("Vehicle Information" / "Driver Information") in `#878787`
- ADD VEHICLE / ADD DRIVER button (SVG image, blue solid)
- Edit Details button (SVG image)
- Cards/Grid toggle (inline with filters)
- Search bar (same style as property page)
- Filter dropdowns (Body Type, State LIC for vehicles; State LIC, Experience for drivers)

#### Modals
- **Add Vehicle**: Vehicle Details card + Garaging Address card + Coverages tag picker (12 options, click to add/remove, ✕ to remove from selection box)
- **Add Driver**: Driver Details (Name, Sex, License, State LIC, DOB, Marital, Exp, Hired, Yr LIC — all in one row) + Address card below
- **Edit Vehicle Details**: Appian-style editable grid (a!gridLayout) — inline text inputs/selects, transparent borders until focused, blue focus ring, delete icon per row with confirmation
- **Edit Driver Details**: Same editable grid style with DOB, Marital, Yr LIC columns
- **Single Edit** (from card kebab menu): Dedicated modal for one vehicle/driver
- **Delete Confirmation**: "Are you sure you want to delete [name]? This action cannot be undone." — CANCEL + DELETE (red)

#### LIC Renewal Logic
- `Yr LIC` = year license was issued
- License valid for 5 years from issue
- Calculated: `yearsLeft = (licYear + 5) - currentYear`
- Display: `{licYear} · {X yrs left}` with color coding:
  - Green: 2+ years left
  - Amber: 1 year left
  - Red: "Expires this yr" or "Expired"

---

## Part 3: Design Decisions & Justifications

### Why cards layout?
- A card concentrates all information about one entity in a single vertical block
- User's eye stays in one place to understand a complete vehicle/driver
- In a grid, same info is spread across a wide horizontal row — user must scan left to right, often losing track
- Cards reduce cognitive load per record; grid is better for cross-record comparison
- Default is cards (primary task = understand individual records), grid is toggle option

### Why left nav instead of tabs?
- Vehicles and drivers are separate entities with different schemas
- Persistent nav allows quick switching without losing context or scroll position
- Blue left bar (from Aurora/Appian pattern) gives clear active state

### Why both card edit and bulk edit?
- **Card kebab → Edit Details**: Quick individual correction (change one driver's address)
- **Top Edit button → Editable grid**: Mass updates (update all state LICs after relocation)
- Different tasks need different tools

### Why delete confirmation?
- Destructive actions are irreversible in production
- 24+ records means accidental clicks are likely
- Simple dialog adds 1 click but prevents data loss

### Why tag-based coverages (not grid)?
- Auto coverages are predefined options (not free-form amounts like property SOI)
- Tag picker is faster than filling a grid row per coverage
- Visual: selected tags in box show what's applied at a glance

---

## Part 4: Consistency Between Products

| Element | Property | Automobile |
|---------|----------|------------|
| Sub-tabs | Loss History / Risk Exposure | Same |
| Search bar | Same `.search-box` style | Same |
| Filter dropdowns | `.sidebar-filter` cards | Same |
| Add button | `/add premise.svg` image | `/add vehicle.svg`, `/add driver.svg` |
| Edit button | `/edit details.svg` image | Same |
| Modal style | `.edit-modal` with header/body/footer | Same |
| Delete warning | SVG-based warning dialog | Text-based confirmation dialog |
| Color system | Aurora-compliant | Same |
| Font | Open Sans | Same |
| Page background | `#FAFAFC` | Same |

---

## Part 5: Aurora Design System Compliance

| Element | Aurora Standard | Status |
|---------|----------------|--------|
| Brand Blue | #2322F0 | ✅ |
| Card borders | #EDEEFA | ✅ |
| Dividers | #DCDCE5 / #F0F0F5 | ✅ |
| Primary text | #222222 | ✅ |
| Secondary text | #636363 / #878787 | ✅ |
| Error/Expired | #991B1B | ✅ |
| Warning/Amber | #92400E | ✅ |
| Success/Green | #117C00 | ✅ |
| Page bg | #FAFAFC | ✅ |
| Card shape | Semi-rounded | ✅ |
| Card shadow | Light drop shadow, no border | ✅ |
| Font | Open Sans | ✅ |
| Buttons | SOLID primary, OUTLINE secondary | ✅ |
| Editable grid | Transparent borders, blue focus | ✅ |
| Kebab menu | 3-dot icon, dropdown on click, close on click-outside | ✅ |
| Tags | Colored bg + text for categories | ✅ |

---

## Part 6: Technical Stack

| Item | Detail |
|------|--------|
| Framework | React 19 + Vite 8 |
| Styling | Custom CSS with Aurora design tokens |
| State | React useState (centralized in App.jsx + CommercialAuto.jsx) |
| Persistence | localStorage for login (4hr session), in-memory for data |
| Data | 24 vehicles + 24 drivers (edge case testing) |
| SAIL Code | Complete interfaces in `/sail/automobile/` and `/sail/property/` |
| Icons | Custom SVGs in `/public/` |
| Responsive | Viewport-locked, only right pane scrolls |

---

## Part 7: SAIL Interfaces Delivered

### `/sail/automobile/` (NEW)
| File | Purpose |
|------|---------|
| `CA_FullPage.sail` | Complete self-contained page (all data + cards + grid + nav) |
| `modal_AddVehicle.sail` | Add vehicle with coverages tag picker |
| `modal_AddDriver.sail` | Add driver (compact row: DOB, marital, exp, hired, yr LIC) |
| `modal_EditVehicleGrid.sail` | Bulk edit editable grid with delete confirmation |
| `modal_EditDriverGrid.sail` | Bulk edit editable grid with delete confirmation |
| `modal_DeleteConfirmation.sail` | Simple delete dialog |
| `CA_VehicleCards.sail` | Vehicle cards component (3-col) |
| `CA_VehicleGrid.sail` | Vehicle grid component |
| `CA_DriverCards.sail` | Driver cards component (3-col with renewal calc) |
| `CA_DriverGrid.sail` | Driver grid component |

### `/sail/property/` (EXISTING)
| File | Purpose |
|------|---------|
| `RE_FullPage.sail` | Property full page |
| `modal_AddPremise.sail` | Add premise with smart auto-fill |
| `modal_EditPremise.sail` | Edit premise |
| `modal_DeletePremise.sail` | Delete premise |
| `modal_AddCoverage.sail` | Add SOI coverage |

---

## Part 8: What's Next

1. Gather final review feedback
2. Deploy to Vercel for stakeholder access
3. Accessibility audit (keyboard nav, screen readers)
4. SAIL implementation in Appian environment
5. Connect to real data model (CDT mappings)
6. Loss History tab design (when requirements defined)
7. Mobile/responsive breakpoint handling

---

## Appendix

- **Prototype**: https://risk-exposure-page.vercel.app
- **GitHub**: https://github.com/rutwikn03/risk-exposure-page
- **Login**: 12 / 12
- **Product switch**: Top-right dropdown ("Commercial Property" ↔ "Commercial Automobile")
