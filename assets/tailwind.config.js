// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/portfolio_template_web.ex",
    "../lib/portfolio_template_web/**/*.*ex"
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // Background Colors
        background: {
          primary: {
            light: '#FFFFFF',
            dark: '#111827'
          },
          secondary: {
            light: '#F9FAFB',
            dark: '#1F2937'
          },
          tertiary: {
            light: '#F3F4F6',
            dark: '#374151'
          }
        },
        // Text Colors
        text: {
          primary: {
            light: '#111827',
            dark: '#F9FAFB'
          },
          secondary: {
            light: '#4B5563',
            dark: '#E5E7EB'
          },
          tertiary: {
            light: '#6B7280',
            dark: '#D1D5DB'
          }
        },
        // Brand Colors
        brand: {
          DEFAULT: '#2563EB',
          dark: '#1D4ED8',
          light: '#3B82F6'
        },
        // Accent Colors
        accent: {
          DEFAULT: '#EC4899',
          dark: '#DB2777',
          light: '#F472B6'
        },
        // Border Colors
        border: {
          light: {
            DEFAULT: '#E5E7EB',
            dark: '#374151'
          },
          medium: {
            DEFAULT: '#D1D5DB',
            dark: '#4B5563'
          }
        },
        // Utility Colors
        utility: {
          success: '#10B981',
          error: '#EF4444'
        }
      }
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}
