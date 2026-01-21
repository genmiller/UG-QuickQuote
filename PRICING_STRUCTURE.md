# Pricing Structure - Silk Screen Printing

## Overview

The silk screen pricing matrix **includes the cost of a basic garment**. Premium garments have an upcharge added to the matrix price.

---

## How It Works

### Formula for Silk Screen:

```
Total Price = (Matrix Price + Premium Upcharge) × Quantity
```

Where:
- **Matrix Price** = Based on colors & quantity (includes basic garment)
- **Premium Upcharge** = Extra cost for premium garments (¥0 for basic)

---

## Example: Standard T-Shirt (Basic Garment)

**Order:** 30 shirts, 1 color, Standard T-shirt

```
Matrix Price (1 color, 20-39 qty): ¥1,260
Premium Upcharge (Standard Tee):   ¥0
Total per shirt:                   ¥1,260 ✓
```

---

## Example: Hoodie (Premium Garment)

**Order:** 30 hoodies, 1 color, Pullover Hoodie

```
Matrix Price (1 color, 20-39 qty): ¥1,260
Premium Upcharge (Hoodie):         ¥800
Total per shirt:                   ¥2,060
```

---

## Current Upcharge Table

### Apparel (ウェア)

| Garment | Base Price | Silk Upcharge (JPY) | Silk Upcharge (USD) | Type |
|---------|------------|---------------------|---------------------|------|
| Standard T-Shirt | ¥600 | ¥0 | $0.00 | Basic ✓ |
| Heavy Weight T-Shirt | ¥900 | ¥300 | $3.00 | Premium |
| Pullover Hoodie | ¥3,000 | ¥800 | $8.00 | Premium |
| Zip-up Hoodie | ¥3,500 | ¥1,000 | $10.00 | Premium |

### Goods (グッズ・ステッカー)

| Item | Base Price | Silk Upcharge (JPY) | Silk Upcharge (USD) |
|------|------------|---------------------|---------------------|
| Die-cut Sticker (Small) | ¥100 | ¥50 | $0.50 |
| Die-cut Sticker (Large) | ¥300 | ¥100 | $1.00 |
| Tote Bag | ¥800 | ¥200 | $2.00 |

### Signage (のぼり・横断幕)

| Item | Base Price | Silk Upcharge (JPY) | Silk Upcharge (USD) |
|------|------------|---------------------|---------------------|
| Nobori Flag | ¥1,800 | ¥0 | $0.00 |
| Mesh Banner | ¥5,000 | ¥0 | $0.00 |

---

## Pricing for Other Services

For **non-silk** services (DTF, Embroidery, Sublimation, etc.):

```
Total Price = Garment Base Price + Service Cost
```

These services use the **full garment base price** shown in the table above.

---

## Technical Implementation

### Data Structure

Each garment item has:
```javascript
{
    nameJa: "プルオーバーパーカー",
    nameEn: "Pullover Hoodie",
    priceJP: 3000,           // Base price (for DTF, Embroidery, etc.)
    priceUS: 25.00,
    silkUpchargeJP: 800,     // Extra charge for silk screen
    silkUpchargeUS: 8.00,
    isBasic: false           // true = no upcharge
}
```

### Calculation Logic

```javascript
if (method === 'silk') {
    // Matrix price already includes basic garment
    totalPerUnit = matrixPrice + silkUpcharge;
} else {
    // Other services add full garment price
    totalPerUnit = garmentBasePrice + serviceCost;
}
```

---

## User Experience

When silk screen is selected:

1. **Basic garments** show normal price
   - Standard T-Shirt: ¥600/pc (no upcharge note)

2. **Premium garments** show upcharge
   - Hoodie: ¥3,000/pc
   - **Orange text:** +¥800 プレミアム追加 (premium upcharge)

This makes it clear to customers when they're selecting a premium item.

---

## Updating Prices

### To Change Upcharges:

Edit the `itemsData` object in `index.html`:

```javascript
{ 
    nameJa: "ヘビーウェイトTシャツ", 
    nameEn: "Heavy Weight T-Shirt", 
    priceJP: 900, 
    priceUS: 8.00, 
    silkUpchargeJP: 300,    // ← Change this
    silkUpchargeUS: 3.00    // ← And this
}
```

### To Add New Garments:

```javascript
items: [
    // ... existing items ...
    { 
        nameJa: "新商品", 
        nameEn: "New Product", 
        priceJP: 1500, 
        priceUS: 12.00, 
        silkUpchargeJP: 400,     // Set upcharge
        silkUpchargeUS: 4.00,
        isBasic: false           // false = has upcharge
    }
]
```

### To Mark as Basic (No Upcharge):

```javascript
{ 
    nameJa: "ベーシックTシャツ", 
    nameEn: "Basic T-Shirt", 
    priceJP: 500, 
    priceUS: 4.50, 
    silkUpchargeJP: 0,       // No upcharge
    silkUpchargeUS: 0,
    isBasic: true            // Mark as basic
}
```

---

## Testing Checklist

- [x] Standard T-shirt (30 qty, 1 color) = ¥1,260/ea ✓
- [ ] Heavy Weight Tee (30 qty, 1 color) = ¥1,260 + ¥300 = ¥1,560/ea
- [ ] Hoodie (30 qty, 1 color) = ¥1,260 + ¥800 = ¥2,060/ea
- [ ] Multiple colors increases matrix price correctly
- [ ] Currency switch updates upcharges (JPY ↔ USD)
- [ ] Premium upcharge note shows/hides based on service type
- [ ] DTF/Embroidery use full garment base price

---

## Notes

- Current upcharge values are **placeholder/random numbers**
- Replace with actual pricing based on:
  - Garment quality/thickness
  - Print difficulty
  - Material compatibility
  - Supplier costs

**Last Updated:** December 10, 2025  
**Status:** ✅ Fixed and ready for testing
