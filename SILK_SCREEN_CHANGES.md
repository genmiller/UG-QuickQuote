# Silk Screen Order Flow Changes (v2)

## Overview
Redesigned the order flow for silk screen printing where users **select locations first, then specify colors for each location**.

## New Flow

### Design Details Section (Step 2)

Users can now:
1. **Add multiple locations** dynamically
2. For each location, specify:
   - **Location type** (from dropdown)
   - **Number of colors** (1-4+)
3. See a **live summary** of all locations and colors

### Available Locations

Standard locations:
- Left Chest (左胸)
- Right Chest (右胸)
- Front Overall (全面)
- Back Overall (背面全体)
- Left Sleeve (左袖)
- Right Sleeve (右袖)
- Back Neck (バックネック)

Special options:
- **Undecided** (未定) - Just specify colors without location
- **Other** (その他) - Custom location with text input

## User Interaction

### Step-by-Step
1. **Select Service**: Click "Silk Screen" service bubble
2. **Add Locations**:
   - First location is auto-added
   - Click "Add Location" (位置を追加) to add more
   - For each location:
     - Choose location from dropdown
     - Select number of colors (1-4+)
     - If "Other" selected, text field appears
   - Remove unwanted locations with delete button
3. **View Summary**: Real-time summary shows all locations with color counts
4. **Input Total Quantity**: Enter total garments
5. **Select Items**: Choose garments and quantities

### Example Usage

**Example 1**: Simple design
- Front Overall: 2 colors
- Back Neck: 1 color

**Example 2**: Complex design
- Left Chest: 1 color
- Front Overall: 3 colors  
- Back Overall: 2 colors
- Left Sleeve: 1 color

**Example 3**: Undecided location
- Undecided: 2 colors
- (Customer will decide location later)

**Example 4**: Custom location
- Other: "Inside collar"
- Colors: 1

## Technical Details

### Dynamic Form Generation
- Each location is a separate card with:
  - Location dropdown (`.silk-location-select`)
  - Colors dropdown (`.silk-colors-select`)
  - Delete button
  - Optional text input for "Other" option (`.silk-other-text`)

### Data Capture
- **Form field**: `entry.987654321` (silk-locations-data)
- **Format**: `Location1:Colors | Location2:Colors | ...`
- **Example**: `Left Chest:2 | Front Overall:3 | Back Neck:1`

### JavaScript Functions
- `addSilkLocation()` - Adds a new location card
- `removeSilkLocation(id)` - Removes a location card
- `toggleOtherInput(id)` - Shows/hides "Other" text field
- `updateSilkSummary()` - Updates summary and form data
- `refreshSilkLocationLabels()` - Updates labels on language change

### Bilingual Support
- All labels automatically update when language is changed
- Summary updates in real-time with proper translations
- "Other" location preserves custom text across language switches

## Features

✅ **Dynamic location management** - Add/remove as needed  
✅ **Per-location color specification** - Different colors for different locations  
✅ **Undecided option** - For customers still planning  
✅ **Custom locations** - Text input for special requests  
✅ **Real-time summary** - See all selections at a glance  
✅ **Bilingual** - Japanese/English support  
✅ **Mobile responsive** - Works on all screen sizes

## Pricing Integration

The system captures the **maximum color count** across all locations for pricing calculation:
- If Location A has 2 colors and Location B has 3 colors
- Price calculation uses 3 colors (the maximum)

This can be customized to calculate based on:
- Total unique colors across all locations
- Sum of all location color counts
- Per-location pricing
