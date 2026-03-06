# Diet Meal Planning Assistant

This repo contains the Protein Sparing Modified Fast (PSMF) diet plan and is used for weekly meal planning.

## Purpose

Help plan meals for each week, including generating grocery lists split across 2 shopping trips per week.

## Key Diet Rules

- **11 oz protein per day** (weighed after cooking, bone/fat removed)
- **3 vegetable servings per day** (each serving = 3.5 oz unless otherwise noted)
- All food must be broiled, roasted, boiled, or charcoal broiled - no added fat
- Only foods explicitly listed in the plan are allowed
- Weigh and measure everything
- 1/4 tsp salt per meal (3/4 tsp/day total)
- 6+ glasses of fluid per day
- Take all supplements daily

## Daily Protein Breakdown

| Meal      | Protein |
| --------- | ------- |
| Breakfast | 2 oz    |
| Lunch     | 4 oz    |
| Dinner    | 4 oz    |
| Snack     | 1 oz    |

## Preferred Weekday Template

**Breakfast (2 oz protein):**
- Default: 2 egg whites (1 oz) + cottage cheese (1/4 cup = 1 oz)
- Alt: 2 egg whites (1 oz) + 1 whole egg (1 oz) as a plain omelette

**Lunch (4 oz protein, 1 veggie serving):**
- Mixed salad: ~1.2 oz greens + remaining veg up to 3.5 oz total (tomato, cucumber, radish, carrot)
  - Dressed with either plain balsamic vinegar or Walden Farms dressing
- 4 oz protein on the side (usually chicken)

**Snack (1 oz protein):**
- 1 low-fat Baby Bel mini cheese wheel

**Dinner (4 oz protein, 2 veggie servings):**
- Roasted vegetables (1-2 kinds, 2 servings worth)
- 4 oz protein (varies - chicken, fish, beef, etc.)

## Protein Equivalents to Remember

- 2 egg whites = 1 oz protein
- 1 whole egg = 1 oz protein (max 4 yolks/week)
- 1/4 cup cottage cheese (low-fat) = 1 oz protein (max 2 oz/day)
- 1 oz low-fat cheese = 1 oz protein (max 1 oz/day)
  - Baby Bel Lite = good snack option

## Grocery Planning

- 2 shopping trips per week (e.g., Sunday and Thursday morning)
- Trip 1 covers Mon-Wed, Trip 2 covers Thu-Sun (adjust as needed)
- Prioritize freshness: buy proteins and salad veg in appropriate splits
  - Salad ingredients can usually be bought all at once for the week on Trip 1
- Staples that last all week (eggs, cottage cheese, cheese wheels, spices) can go in Trip 1

## Repo Structure

- `.diet/` - Diet reference files:
  - `rules.md` - Diet instructions, supplements, daily allowances
  - `allowed-foods.md` - All allowed proteins, vegetables (including weights), beverages, sweeteners
  - `misc-products.md` - OTC meds, flavor enhancers, herbs & spices, Plan B triggers
  - `tips.md` - Eating out, traveling, grocery shopping tips
  - `recipes/` - Optional recipe files organized by category:
    - `drinks.md`, `soups.md`, `entrees.md`, `misc.md`
    - `eggs.md`, `dressings.md`, `pickles.md`
    - `desserts.md`, `sides.md`

## When Creating Meal Plans

1. Always verify foods against `.diet/allowed-foods.md` - never suggest unlisted items
   - If relevant, ask for permission if attempting an unlisted food
2. Respect all daily limits (egg yolks, cottage cheese, cheese, sweeteners, etc.)
3. Track egg yolk usage across the week (max 4 yolks/week)
4. Vary dinner proteins throughout the week for nutritional balance (more seafood/poultry, less beef - prefer red meat on Friday/weekend as an end of week reward)
5. Use the preferred weekday template as the default - only deviate when asked or for variety at dinner
6. Keep lunch salad composition consistent unless asked to change
7. For dinner veggies, suggest from the allowed list: asparagus, broccoli, cauliflower, green beans, squash, brussels sprouts, zucchini, etc.
8. When generating grocery lists, group by store section (produce, meat/seafood, dairy, pantry)
9. Account for recipe ingredients if a recipe from `.diet/recipes/` is planned for the week

Place generated plans as JSON into `plans/yyyy-mm-dd.json` (where date is the Sunday).

### JSON Plan Schema

```json
{
  "weekOf": "yyyy-mm-dd",
  "days": [
    {
      "date": "yyyy-mm-dd",
      "meals": {
        "breakfast": {
          "protein": [{ "item": "name", "qty": "optional amount", "oz": 1 }],
          "vegetables": [],
          "notes": "cooking method or other info",
          "yolk": false,
          "dressing": "optional"
        },
        "lunch": { "...same structure..." },
        "snack": { "...same structure..." },
        "dinner": { "...same structure..." }
      }
    }
  ],
  "groceryTrips": [
    {
      "date": "yyyy-mm-dd",
      "label": "Trip 1",
      "covers": "Sunday - Wednesday",
      "sections": [
        {
          "name": "Meat & Seafood",
          "items": [{ "item": "name", "qty": "amount", "note": "optional" }]
        }
      ]
    }
  ]
}
```

Vegetable entries use: `{ "item": "name", "servings": 1, "cooking": "roasted", "contents": "optional details" }`

### Viewer App

Run `./serve.sh` to view plans in a browser. The script generates `index.html` from `viewer.html` (template) and starts a local server.
