// Settings for the support page. No secrets here: all values are public.
window.SUPPORT_CONFIG = {
  // PayPal account that receives the donations (email or merchant ID).
  paypalBusiness: "daniel.mazhbits@gmail.com",

  // Public address of this page. PayPal sends the donor back here.
  pageUrl: "https://danielmazh.github.io/support-page/",

  // Supabase tracking. Leave both empty to turn tracking off.
  // The key is the publishable key (safe in a public page), never the service key.
  supabaseUrl: "",
  supabaseKey: "",

  // Preset amounts per language. First currency is the default.
  amounts: {
    he: { currency: "ILS", symbol: "₪", presets: [10, 20, 50], selected: 20 },
    en: { currency: "USD", symbol: "$", presets: [3, 5, 10], selected: 5 },
  },

  // Known apps: slug -> display name. A link uses ?app=<slug>.
  // An unknown slug still works and is still tracked, with generic text.
  apps: {
    "speaker-trainer": { he: "Speaker Trainer", en: "Speaker Trainer" },
    "imt-flow": { he: "IMT Flow", en: "IMT Flow" },
    "quickflow": { he: "QuickFlow", en: "QuickFlow" },
    "household-shop": { he: "Household Shop", en: "Household Shop" },
    "oeuvre": { he: "Oeuvre", en: "Oeuvre" },
    "kolli": { he: "קולי", en: "Kolli" },
  },
};
