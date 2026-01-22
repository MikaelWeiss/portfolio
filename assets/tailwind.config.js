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
        surface: {
          primary: '#0D0D0D',
          secondary: '#141414',
          tertiary: '#1A1A1A',
          elevated: '#242424',
        },
        ink: {
          primary: '#F5F0E8',
          secondary: '#B8B0A0',
          tertiary: '#706B63',
          muted: '#4A4640',
        },
        accent: {
          warm: '#FF6B35',
          warmDark: '#E55A2B',
          warmLight: '#FF8255',
          electric: '#00D4FF',
          electricDark: '#00B8E0',
        },
        border: {
          subtle: '#2A2A2A',
          medium: { DEFAULT: '#3A3A3A', dark: '#3A3A3A' },
          strong: '#4A4A4A',
          light: { DEFAULT: '#E5E7EB', dark: '#2A2A2A' },
        },
        brand: {
          DEFAULT: '#FF6B35',
          dark: '#E55A2B',
          light: '#FF8255'
        },
        background: {
          primary: { light: '#FFFFFF', dark: '#0D0D0D' },
          secondary: { light: '#FAFAFA', dark: '#141414' },
          tertiary: { light: '#F5F5F5', dark: '#1A1A1A' }
        },
        text: {
          primary: { light: '#111827', dark: '#F5F0E8' },
          secondary: { light: '#6B7280', dark: '#B8B0A0' },
          tertiary: { light: '#9CA3AF', dark: '#706B63' }
        },
        utility: {
          success: '#10B981',
          error: '#EF4444'
        }
      },
      fontFamily: {
        display: ['Syne', 'system-ui', 'sans-serif'],
        body: ['"Cabinet Grotesk"', 'system-ui', 'sans-serif'],
        mono: ['"JetBrains Mono"', 'Menlo', 'Monaco', 'monospace'],
      },
      fontSize: {
        'hero': ['clamp(3.5rem, 12vw, 10rem)', { lineHeight: '0.9', letterSpacing: '-0.04em', fontWeight: '800' }],
        'display-xl': ['clamp(2.5rem, 8vw, 6rem)', { lineHeight: '0.95', letterSpacing: '-0.03em', fontWeight: '700' }],
        'display-lg': ['clamp(2rem, 5vw, 4rem)', { lineHeight: '1', letterSpacing: '-0.02em', fontWeight: '700' }],
        'display-md': ['clamp(1.5rem, 3vw, 2.5rem)', { lineHeight: '1.1', letterSpacing: '-0.02em', fontWeight: '600' }],
        'body-xl': ['1.375rem', { lineHeight: '1.6' }],
        'body-lg': ['1.125rem', { lineHeight: '1.7' }],
        'body': ['1rem', { lineHeight: '1.75' }],
        'body-sm': ['0.875rem', { lineHeight: '1.6' }],
        'label': ['0.75rem', { lineHeight: '1.4', letterSpacing: '0.08em', fontWeight: '500' }],
      },
      spacing: {
        '18': '4.5rem',
        '22': '5.5rem',
        '30': '7.5rem',
        '88': '22rem',
        '100': '25rem',
        '120': '30rem',
        '140': '35rem',
      },
      animation: {
        'fade-up': 'fadeUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards',
        'fade-in': 'fadeIn 0.6s ease-out forwards',
        'slide-in-right': 'slideInRight 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards',
        'scale-in': 'scaleIn 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards',
        'marquee': 'marquee 30s linear infinite',
        'marquee-reverse': 'marquee 30s linear infinite reverse',
        'grain': 'grain 8s steps(10) infinite',
        'pulse-slow': 'pulse 4s ease-in-out infinite',
      },
      keyframes: {
        fadeUp: {
          '0%': { opacity: '0', transform: 'translateY(40px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideInRight: {
          '0%': { opacity: '0', transform: 'translateX(-60px)' },
          '100%': { opacity: '1', transform: 'translateX(0)' },
        },
        scaleIn: {
          '0%': { opacity: '0', transform: 'scale(0.9)' },
          '100%': { opacity: '1', transform: 'scale(1)' },
        },
        marquee: {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(-50%)' },
        },
        grain: {
          '0%, 100%': { transform: 'translate(0, 0)' },
          '10%': { transform: 'translate(-5%, -10%)' },
          '20%': { transform: 'translate(-15%, 5%)' },
          '30%': { transform: 'translate(7%, -25%)' },
          '40%': { transform: 'translate(-5%, 25%)' },
          '50%': { transform: 'translate(-15%, 10%)' },
          '60%': { transform: 'translate(15%, 0%)' },
          '70%': { transform: 'translate(0%, 15%)' },
          '80%': { transform: 'translate(3%, 35%)' },
          '90%': { transform: 'translate(-10%, 10%)' },
        },
      },
      transitionTimingFunction: {
        'out-expo': 'cubic-bezier(0.16, 1, 0.3, 1)',
        'in-out-expo': 'cubic-bezier(0.87, 0, 0.13, 1)',
      },
      transitionDuration: {
        '400': '400ms',
        '600': '600ms',
        '800': '800ms',
      },
      backgroundImage: {
        'noise': "url(\"data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noiseFilter'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noiseFilter)'/%3E%3C/svg%3E\")",
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      },
      boxShadow: {
        'glow': '0 0 60px -12px rgba(255, 107, 53, 0.4)',
        'glow-lg': '0 0 100px -20px rgba(255, 107, 53, 0.5)',
        'inner-glow': 'inset 0 0 60px -12px rgba(255, 107, 53, 0.15)',
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),
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
