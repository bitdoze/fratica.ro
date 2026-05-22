// Site configuration
export const siteConfig = {
  // Language setting
  lang: "ro",
  
  // Site details from config.json:site
  title: "Fratica.ro", // from config.json:site.title
  // description is used from existing site.ts, will be updated by config.json:metadata.meta_description
  // url is removed, Astro.site will be used

  // from config.json:site (logo related)
  logo: "/logo.svg",
  logoWidth: "200",
  logoHeight: "30",
  logoText: "Fratica.ro",

  // SEO metadata from config.json:metadata
  author: "Echipa Fratica.ro", // from config.json:metadata.meta_author
  description: "Ghiduri practice in romana despre bani, cariera, tehnologie, AI, viata de zi cu zi si decizii mai bune.", // from config.json:metadata.meta_description
  ogImage: "/images/og-image.svg",

  // Pagination settings from config.json:settings
  postsPerPage: 11, // from config.json:settings.pagination
  summaryLength: 100, // from config.json:settings.summary_length
  
  // SEO settings (existing in site.ts)
  noindex: {
    tags: true, // Set to true to add noindex meta tag to tag pages
    categories: false, // Set to true to add noindex meta tag to category pages
    authors: false, // Set to true to add noindex meta tag to author pages
  },
  
  // Params from config.json:params
  copyright: "Copyright © 2026", // from config.json:params.copyright
};
