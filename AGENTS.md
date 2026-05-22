# Agents Guide for fratica.ro

Date: 22 May 2026

## Commands

- **dev**: `npm run dev` - Start the Astro development server, usually on localhost:4321
- **build**: `npm run build` - Build the static production site into `dist/`
- **preview**: `npm run preview` - Preview the production build locally
- **no tests**: No test scripts are configured in `package.json`

## Architecture

- **Astro v6** Romanian blog/content site with MDX support, RSS, sitemap generation, and static output
- **Content Collections**: `posts/`, `authors/`, `pages/`, `about/` in `src/content/`
- **Content schema**: Zod validation in `src/content.config.ts`
- **Config**: `site.ts`, `menu.json`, `social.json`, `config.json` in `src/config/`
- **Layouts**: `Layout.astro` for main pages, `PostLayout.astro` for articles
- **Components**: shared UI under `src/layouts/components/`
- **Styling**: Tailwind CSS v4 with `@tailwindcss/typography`
- **Search**: client-side search with Fuse.js and generated `search.json`
- **Assets**: content images in `src/assets/images/`; static public files in `public/`

## Code Style

- **Language**: Public-facing website copy must be in Romanian
- **TypeScript**: Strict mode via `astro/tsconfigs/strict`
- **Path aliases**: `@components/*`, `@layouts/*`, `@config/*`, `@utils/*`, `@styles/*`, `@assets/*`
- **Naming**: kebab-case for files/slugs, camelCase for variables, PascalCase for Astro components
- **Imports**: Prefer configured path aliases for internal imports
- **Content files**: Use `.md` or `.mdx` in `src/content/posts/`
- **Frontmatter**: Use clear Romanian titles and descriptions; keep categories and tags relevant
- **Dates**: Use ISO dates in frontmatter, for example `date: 2026-05-22`

## Required Post Frontmatter

```yaml
---
title: "Titlu articol"
meta_title: "Titlu SEO optional"
description: "Descriere scurta pentru SEO si carduri."
date: 2026-05-22
image: "../../assets/images/nume-articol.svg"
authors: ["admin"]
categories: ["Ghiduri practice"]
tags: ["romania", "ghiduri", "anaf"]
draft: false
---
```

- `title` is required
- `image` is required by the current posts schema
- `authors` defaults to `admin`, but include it explicitly for clarity
- Use no more than 3 tags per article
- Prefer one main category per article unless there is a strong reason for more

## Content Strategy for Fratica.ro

Fratica.ro is a Romanian life and how-to hub. Write practical content people actually search for in Romanian. Avoid generic filler, vague advice, and overly technical explanations unless the article explicitly targets advanced readers.

Primary content pillars:

- **Ghiduri practice**: step-by-step guides for Romanian bureaucracy, taxes, ANAF, SRL/PFA, car imports, banking, money transfers, services, documents
- **Bani si cariera**: salaries in Romania, remote jobs for Romanians, beginner investing, BVB, ETFs, crypto basics, realistic side hustles
- **Tech si AI**: useful apps, buying guides for phones/laptops/tablets, ChatGPT/Claude usage, privacy, security for normal users
- **Lifestyle practic**: moving abroad, healthcare systems, private insurance, education, online courses, diploma recognition, fast recipes, weekly budgets
- **Digest tech si stiinta**: curated weekly summaries, not breaking news; focus on what is worth attention and why it matters

## Editorial Guidelines

- Write in Romanian, with a direct and helpful tone
- Use Romanian search intent in titles and headings, for example `Cum sa...`, `Ghid complet...`, `Cat costa...`, `Ce trebuie sa stii...`
- Start with the practical answer, then add context
- Use clear headings, bullet lists, numbered steps, checklists, and comparison tables where useful
- Include concrete examples, costs, documents, timelines, eligibility rules, and caveats when relevant
- Explain acronyms and institutions for non-experts
- Distinguish between facts, estimates, and opinion
- For legal, tax, medical, or financial topics, verify current information and add a short disclaimer where appropriate
- Avoid hype, marketing fluff, and promises of guaranteed results
- Keep paragraphs short and scannable

## SEO Guidelines

- Put the main Romanian keyword naturally in the title, description, intro, and at least one heading
- Use descriptive slugs in Romanian without diacritics, for example `cum-sa-iti-deschizi-srl-2026.md`
- Add internal links to related articles when available
- Use tables for comparisons such as Wise vs Revolut vs bank transfer, SRL vs PFA, ETFs vs deposits
- Write meta descriptions that explain the article benefit in one sentence
- Avoid keyword stuffing

## Image Guidelines

- Every article must have a simple SVG cover image in `src/assets/images/`
- Use 16:9 format, usually `1280x720`
- Keep the design clean with a light background and strong contrast
- Use a short visible text label of maximum 5 words
- Make text large enough to be readable on mobile cards
- Avoid clutter, tiny icons, heavy gradients, and too many decorative elements
- Reference the SVG from frontmatter with a relative path, for example `../../assets/images/bine-ati-venit-pe-fratica.svg`

## Available Widgets

Import widgets from `@components/widgets/` in MDX articles when they improve readability. Do not overuse widgets.

- **Accordion**: `<Accordion label="FAQ Title" group="faq" expanded="true">content</Accordion>`
- **Button**: `<Button text="Click Here" link="/url" variant="solid" color="blue" size="md" icon="arrow-right" />`
- **Notice**: `<Notice type="info|success|warning|error" title="Important">content</Notice>`
- **ListCheck**: `<ListCheck><ul><li>Checkmark item 1</li><li>Item 2</li></ul></ListCheck>`
- **YouTubeEmbed**: `<YouTubeEmbed url="https://youtube.com/embed/VIDEO_ID" label="Video Title" />`
- **Tabs/Tab**: `<Tabs><Tab name="Tab 1">content</Tab><Tab name="Tab 2">content</Tab></Tabs>`
- **SeriesNav**: Used by layouts for series navigation when post frontmatter includes `series`
- **AmazonProduct**: Use only when the component exists and the article genuinely needs a product box

## Article Workflow for Agents

1. Choose the correct content pillar and category.
2. Create or update the article in `src/content/posts/` with a Romanian kebab-case filename.
3. Create a matching SVG cover in `src/assets/images/`.
4. Add frontmatter with title, description, date, image, authors, category, tags, and draft status.
5. Write a practical Romanian article with clear headings and actionable steps.
6. Use widgets only when they make the article easier to understand.
7. Run `npm run build` before finishing and fix content schema or routing errors.

## Important Notes

- Do not revert unrelated user changes in the working tree.
- Keep Fratica.ro focused on practical Romanian content, not generic tech-blog template copy.
- Prefer updating existing config/content patterns over adding new frameworks or abstractions.
- When writing time-sensitive articles for 2026+ rules, taxes, prices, laws, products, or services, verify current facts before publishing.
