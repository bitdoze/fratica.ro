// Site configuration
export const siteConfig = {
  // Language setting
  lang: "ro",
  
  // Site details from config.json:site
  title: "fratica.ro",
  // description is used from existing site.ts, will be updated by config.json:metadata.meta_description
  // url is removed, Astro.site will be used

  // from config.json:site (logo related)
  logo: "/logo.svg",
  logoWidth: "200",
  logoHeight: "30",
  logoText: "fratica.ro",

  // SEO metadata from config.json:metadata
  author: "fratica.ro",
  description: "Resurse și tutoriale pe fratica.ro",
  ogImage: "/images/og-image.png",

  // Pagination settings from config.json:settings
  postsPerPage: 11,
  summaryLength: 100,
  
  // SEO settings
  noindex: {
    tags: true,
    categories: false,
    authors: false,
  },
  
  // Params from config.json:params
  copyright: "Copyright © 2025 fratica.ro",
};
