# Risk Exposure — UX Redesign

## Prepared by: Rutwik Nakkalla
## For Review: Charles

---

## Slide 1: Title

**Risk Exposure Module — UX Redesign**
Connected Underwriting | Commercial Property

- Objective: Improve usability, visual clarity, and workflow efficiency for Premise & Coverage management
- Platform: Appian (Aurora Design System compliant)
- Prototype: [Live Demo](https://risk-exposure-page.vercel.app) | [GitHub](https://github.com/rutwikn03/risk-exposure-page)
- Figma: [Design File](https://www.figma.com/design/X87mYRwjjjqw9S9m2foDtf/Risk-exposure-screens)

---

## Slide 2: Current Experience — What Exists Today

### Main View (Risk Exposure tab):
- **Single flat table** combining premise info + coverage data in one grid
- Columns: LOC/BLD #, Address, Bld. Improvement Roofing Yr., Yr. Built, Construction Type, Subject of Insurance, Amount, Coins%, Valuation, Causes of Loss, Inflation Guard
- Same address/building info **repeated on every row** for each SOI entry under that premise
- No visual separation between different premises
- Only a "Search Premises" bar and "Edit Premises" button at the top
- Users must scroll through the entire table to find a specific building

### Edit Modal (Current):
- **One large modal** for all editing — dark overlay
- LOC # and BLD # as small text fields at the top
- All premise fields + entire SOI table crammed into a single scrollable view
- No section separation or visual hierarchy
- "Delete Premise" and "Add Premise" actions buried at bottom
- No confirmation before destructive actions
- No auto-population or smart validation

---

## Slide 3: Problems Identified

| # | Problem | Impact |
|---|---------|--------|
| 1 | **Flat table mixes premises with coverages** | Users can't quickly identify which building they're looking at |
| 2 | **Repetitive data** — same address on every SOI row | Visual clutter, wasted screen space |
| 3 | **No premise-level navigation** | Must scroll/search entire table to find one building |
| 4 | **No building context at a glance** | Construction type, year built hidden as table columns |
| 5 | **Single dense edit modal** | Overwhelming — all fields visible at once |
| 6 | **No progressive disclosure** | Users see complexity before they need it |
| 7 | **No destructive action protection** | Delete premise/remove SOI with no warning |
| 8 | **No smart data entry** | Existing location data not reused when adding buildings |

---

## Slide 4: Design Goals

| Goal | Approach |
|------|----------|
| **Reduce cognitive load** | Split into left panel (premise navigation) + right panel (building details & coverages) |
| **Eliminate repetition** | Show premise info once in a header, coverages in a dedicated table below |
| **Improve discoverability** | Searchable list + filters (Country, Location, Yr. Built) |
| **Provide visual context** | Violet header with info cards (Construction Type, Roofing Yr., Year Built) |
| **Safer destructive actions** | Warning dialogs before delete/remove |
| **Smarter data entry** | Auto-populate existing location data, suggest next building number |
| **Aurora compliance** | Follow Appian design system for colors, typography, cards, buttons |

---

## Slide 5: New Design — Main View

### Layout: Split Panel
- **Left Panel (426px)**: 
  - "Premises" heading + Add Premise button
  - Search bar with search icon
  - Filter dropdowns: Country, Location, Yr. Built
  - Scrollable list of premise cards showing: Location | Building + full address

- **Right Panel**:
  - **Violet header (#E8E7FF)**: Location title, address, action buttons (Delete Premise, Edit Premise)
  - **Info cards row**: Construction Type, Bld. Improvement Roofing Year, Year Built — each with distinct icon
  - **"Property Coverages" section**: Heading + Add Coverage button + clean data table

### Key Difference:
- Current: 1 flat table with 11+ columns mixing premise + coverage data
- New: Premise context shown ONCE in header → coverages as focused table below

---

## Slide 6: New Design — Edit Premise Modal

### Structure:
1. **Sticky Header**: "Edit Premise" title
2. **Scrollable Body**:
   - Premise Details (gray card): Location #, Building #, Street Address, City, State, Country, Zip
   - Building Details (gray card): Construction Type (dropdown), Roofing Yr., Year Built
   - Subjects of Insurance section: Heading + Add button + editable grid
3. **Sticky Footer**: Cancel + Edit buttons (always visible)

### Improvements over current:
- Sections clearly separated with labeled gray cards
- Dropdowns for categorical fields (Subject, Valuation, Cause of Loss, Construction Type)
- Clone row (duplicate) + Remove row (with confirmation)
- Editable "Forms & Conditions" text field
- Scrolls gracefully when many SOI rows added

---

## Slide 7: New Design — Add Premise (Smart Flow)

### Smart Auto-Fill:
1. User enters **Location Number** (e.g., "1")
2. If Location 1 exists → **auto-populates** Street, City, State, Country, Zip
3. **Next available Building #** auto-filled with green hint: "This is the next available number"
4. If user manually enters a duplicate building # → **red inline error**: "A building with this Building Number already exists. Next available: X"

### Validation:
- Location # and Building # accept **integers only**
- Red border + error message for invalid input
- ADD button disabled until validation passes

---

## Slide 8: New Design — Confirmation Dialogs

### Delete Premise:
- Click Delete Premise → Warning SVG dialog appears
- Two options: Cancel (dismiss) or Delete (confirm & remove)
- Premise removed from left panel, data cleaned up

### Remove SOI Row:
- Click red ✕ on any SOI row → Remove SOI warning dialog
- Cancel or Remove options
- Prevents accidental data loss

---

## Slide 9: Before vs After Comparison

| Aspect | Before | After |
|--------|--------|-------|
| **Navigation** | Scroll through flat table | Searchable/filterable sidebar |
| **Building context** | Hidden in table columns | Prominent violet header + info cards |
| **Data repetition** | Address repeated per SOI row | Shown once in header |
| **Edit experience** | One dense modal | Structured sections with sticky footer |
| **Add premise** | Manual entry, no guidance | Auto-populate + next number suggestion |
| **Delete safety** | No confirmation | Warning dialog required |
| **Visual hierarchy** | Flat, no sections | Headings, cards, dividers |
| **Filtering** | Single search bar | Country + Location + Year dropdowns |
| **Design system** | Basic Appian default | Aurora-compliant (colors, cards, typography) |

---

## Slide 10: Aurora Design System Compliance

| Element | Aurora Standard | Status |
|---------|---------------|--------|
| Brand Blue | #2322F0 (Blue 3) | ✅ |
| Card Borders | #EDEEFA (Blue 1) | ✅ |
| Dividers | #DCDCE5 | ✅ |
| Primary Text | #222222 (Gray 5) | ✅ |
| Secondary Text | #636363 (Gray 4) | ✅ |
| Error Red | #B2002C (Red 35) | ✅ |
| Success Green | #117C00 (Green 4) | ✅ |
| Page Background | #FAFAFC | ✅ |
| Card Shape | Semi-Rounded (6px radius) | ✅ |
| Font | Open Sans | ✅ |
| Button Patterns | SOLID primary, OUTLINE secondary | ✅ |
| Section Headers | Semi-bold, #878787 | ✅ |
| plus-circle icon for Add actions | ACCENT color, STANDALONE style | ✅ |

---

## Slide 11: Interaction Flow

```
Login (test.ux / appian.ux)
  │
  └─→ Main View (defaults to Location 1 Building 1)
       │
       ├─ LEFT PANEL
       │   ├─ Search premises (real-time filtering)
       │   ├─ Filter by Country / Location / Yr. Built
       │   ├─ Click premise card → Right panel updates
       │   └─ Add Premise → Smart modal with auto-fill
       │
       ├─ RIGHT PANEL (Building Details)
       │   ├─ View: Location, address, info cards, coverage table
       │   ├─ Edit Premise → Modal (all fields editable)
       │   ├─ Delete Premise → Warning → Confirm → Removed
       │   └─ Add Coverage → Modal (add new SOI rows)
       │
       └─ SUB-TAB TOGGLE
           ├─ Risk Exposure → Full detail view
           └─ Loss History → Under Progress placeholder
```

---

## Slide 12: Technical Details

| Item | Detail |
|------|--------|
| Framework | React 19 + Vite 8 |
| Styling | Custom CSS with Aurora design tokens |
| State | Centralized React useState in App.jsx |
| Data | 40 premises, 5 SOI data sets, all editable |
| Persistence | In-memory (edits reflect everywhere instantly) |
| Responsive | Breakpoints at 1200px, 992px, 768px |
| Icons | Custom SVGs from design team |
| Dropdowns | Custom components matching Appian SAIL dropdowns |

---

## Slide 13: Next Steps

1. **Gather feedback** from Charles and stakeholders
2. **Iterate on design** based on review comments
3. **Accessibility testing** — screen readers, keyboard navigation
4. **SAIL implementation planning** — map React components to Appian SAIL equivalents
5. **Data model alignment** — confirm field mappings with backend team
6. **Edge cases** — empty states, loading, error handling, pagination for large premise lists
7. **Loss History tab** — design when requirements are defined

---

## Appendix

- **Live Prototype**: https://risk-exposure-page.vercel.app (or localhost:3000)
- **GitHub**: https://github.com/rutwikn03/risk-exposure-page
- **Figma**: https://www.figma.com/design/X87mYRwjjjqw9S9m2foDtf/Risk-exposure-screens
- **Login**: test.ux / appian.ux
- **Original Figma (initial mockup)**: https://www.figma.com/design/6LJIXizhbQy922i81mWrGD/react-mock
