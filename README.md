# Diet Meal Planner

Weekly meal planning app for a Protein Sparing Modified Fast (PSMF) diet. Plans are stored as JSON and rendered in a simple static web app.

## Usage

### Generate a meal plan

Use Claude Code to generate a new weekly plan:

```
> generate a meal plan for next week
```

Plans are saved as `plans/yyyy-mm-dd.json` (dated by the Sunday of that week).

### View plans locally

```bash
./serve.sh
```

Opens the viewer in your browser at `http://localhost:8079`. Select a plan from the dropdown, browse by day, and use the grocery list with checkable items.

### Deploy to GitHub Pages

After adding or updating a plan:

```bash
./deploy.sh
git push
```

This rebuilds `index.html` with the current plan list and commits it.

## Project Structure

```
plans/          - Weekly meal plans (JSON)
viewer.html     - App template
index.html      - Generated app (built by serve.sh)
serve.sh        - Build + local dev server
deploy.sh       - Rebuild and commit for GitHub Pages
CLAUDE.md       - Instructions for AI-assisted meal plan generation
```
