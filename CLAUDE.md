# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Phoenix-based portfolio website for Mikael Weiss, an iOS developer. The application is structured as a simple portfolio showcase with two main pages:
- Home page: displays personal info, about, skills, experience, projects, awards, volunteer work, and education
- Works page: displays all projects

## Architecture

The application follows standard Phoenix conventions with a few key architectural decisions:

- **Data Management**: All portfolio content is centralized in `lib/portfolio_template/data.ex` as a JSON string that gets parsed and exposed through functions. This allows for easy content updates without database complexity.
- **Controllers**: Simple controller structure with `PageController` handling both routes (`/` and `/works`)
- **Templates**: Uses HEEx templates in `lib/portfolio_template_web/controllers/page_html/`
- **Styling**: Uses TailwindCSS for styling with custom configurations in `assets/tailwind.config.js`

## Development Commands

### Setup and Development
```bash
mix setup                    # Install dependencies and setup assets
mix phx.server              # Start development server (localhost:4000)
iex -S mix phx.server       # Start server with IEx shell
```

### Asset Management
```bash
mix assets.build            # Build assets (Tailwind + ESBuild)
mix assets.deploy           # Build and minify assets for production
```

### Testing
```bash
mix test                    # Run all tests
```

## Deployment

The application is configured for deployment on Fly.io:
- App name: `mikaelweiss`
- Production URL: `mikaelweiss.fly.dev`
- Uses shared-cpu-1x VM size
- Auto-scaling configured (min 0 machines)

To update portfolio content, modify the JSON data in `lib/portfolio_template/data.ex`. Images should be placed in `priv/static/images/`.

## Key Files for Content Updates

- `lib/portfolio_template/data.ex` - All portfolio content (personal info, projects, experience, etc.)
- `priv/static/images/` - Portfolio images
- `lib/portfolio_template_web/controllers/page_html/` - Template files for layout and styling