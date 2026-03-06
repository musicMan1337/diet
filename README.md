# Diet Meal Planner

Weekly meal planning app for a Protein Sparing Modified Fast (PSMF) diet. Plans are stored as JS files and rendered in a static web app — no build step needed.

## Usage

### Generate a meal plan

Use Claude Code to generate a new weekly plan:

```
> generate a meal plan for next week
```

Plans rotate through 3 slots: `last.js` → `current.js` → `next.js`. Each new plan pushes the previous ones back.

### View plans locally

```bash
./serve.sh
```

Opens the viewer at `http://localhost:8079/docs/`.

### Deploy to GitHub Pages

Just push to `main`. Configure GitHub Pages to serve from the `main` branch, `/docs` folder.

## Project Structure

```
docs/
  index.html    - Viewer app (loads plans via script tags)
  current.js    - This week's plan
  last.js       - Previous week
  next.js       - Upcoming week
serve.sh        - Local dev server
CLAUDE.md       - AI meal plan generation instructions
```
