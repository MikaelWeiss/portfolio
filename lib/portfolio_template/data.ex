defmodule PortfolioTemplate.Data do
  @portfolio_data """
  {
    "personal": {
      "name": "Mikael Weiss",
      "title": "Full-Stack Software Engineer • Pilot • Entrepreneur",
      "expertise": ["React", "TypeScript", "Swift", "Linux"],
      "images": {
        "profile": "/images/profile.jpg",
        "about": "/images/about.jpg"
      },
      "social_links": {
        "facebook": "https://www.facebook.com/profile.php?id=100074222080645",
        "twitter": "https://x.com/MikaelWeis2790",
        "linkedin": "https://www.linkedin.com/in/mikael-weiss/",
        "github": "github.com/MikaelWeiss"
      }
    },
    "navigation": {
      "logo": {
        "text": "Mikael Weiss",
        "link": "/"
      },
      "links": [
        {
          "text": "Home",
          "path": "/"
        },
        {
          "text": "Work",
          "path": "/works"
        }
      ]
    },
    "about": {
      "description": "Software engineer with five years shipping production systems across mobile, desktop, web, and Linux. I build interactive systems that span the full development flow — from services hosted on Linux to frontend web, mobile, and desktop apps — using an extensive array of agentic engineering tools and curated AI workflows that produce predictable, high-quality output.",
      "stats": [
        {
          "value": "5+",
          "label": "Years Experience"
        },
        {
          "value": "1,500+",
          "label": "App Downloads"
        }
      ]
    },
    "skills": {
      "frontend": {
        "title": "Frontend",
        "items": [
          { "name": "React" },
          { "name": "TypeScript" },
          { "name": "JavaScript" },
          { "name": "HTML" },
          { "name": "CSS" },
          { "name": "TailwindCSS" },
          { "name": "Vite" },
          { "name": "Electron" },
          { "name": "Phoenix" },
          { "name": "WCAG Accessibility" }
        ]
      },
      "backend": {
        "title": "Languages & Systems",
        "items": [
          { "name": "Swift" },
          { "name": "Elixir/Phoenix" },
          { "name": "Python/FastAPI" },
          { "name": "Rust" },
          { "name": "Linux" },
          { "name": "Bash/ZSH" },
          { "name": "Systemd" },
          { "name": "Automation" },
          { "name": "rsync" },
          { "name": "restic" }
        ]
      },
      "other": {
        "title": "Hardware & AI",
        "items": ["Raspberry Pi", "Soldering", "AI Skills", "Coding Harnesses", "MCP", "ACP", "Multi-Agent Orchestration", "Simplicity"]
      }
    },
    "experience": [
      {
        "title": "Founder & Lead Developer",
        "company": "Weiss Solutions LLC",
        "period": "Jul 2024 - Present",
        "description": [
          "Shipped Strive Planner, a full-stack app with calendar and time tracking, goal-setting, and reflection systems across iOS, macOS, web, and a Phoenix/Elixir backend with full real-time sync (Android coming soon)",
          "Architected a software development lifecycle balancing predictability, quality, and speed through a careful selection of AI tooling",
          "Shipped the mobile and desktop app Open Chat, plus desktop apps Timbre and Splash Screen"
        ],
        "technologies": ["Swift", "SwiftUI", "Elixir", "Phoenix", "Rust"]
      },
      {
        "title": "Software Engineer (Contract)",
        "company": "AskElephant (Remote)",
        "period": "Jan 2026 - Apr 2026",
        "description": [
          "Developed a shared npm dictation library used across multiple AskElephant products, with snippet and audio pipelines",
          "Shipped the Flux and Peanut dictation apps: React, TypeScript, Tailwind, and Shadcn frontend with OpenAI speech-to-text",
          "Refactored a 6,000-line TypeScript file into a properly structured Electron app following common conventions"
        ],
        "technologies": ["React", "TypeScript", "Electron", "Tailwind", "OpenAI"]
      },
      {
        "title": "CTO / Lead Developer",
        "company": "OpSync Services (Remote)",
        "period": "Feb 2025 - Oct 2025",
        "description": [
          "First engineer and technical lead; grew and led a team of a web developer and a mobile intern across the full stack",
          "Curated agentic engineering systems that produced production-ready software across the development lifecycle",
          "Architected the product across a React web frontend, FastAPI backend, Supabase database, and multiple AI integrations"
        ],
        "technologies": ["React", "Python", "FastAPI", "Supabase", "Voice AI"]
      },
      {
        "title": "Software Engineer",
        "company": "FamilySearch",
        "period": "Jan 2025 - Apr 2025",
        "description": [
          "Fixed 100+ WCAG accessibility issues across a product serving thousands of daily users",
          "Modernized 10,000+ lines of code to async/await, fixing 100+ concurrency-related bugs"
        ],
        "technologies": ["Swift", "Async/Await", "Accessibility"]
      },
      {
        "title": "Software / App Developer (Contract)",
        "company": "Bryce Labs, High Country Living, Elements Financial, Pastimes",
        "period": "2020 - 2025",
        "description": [
          "Built greenfield products from client descriptions and mock-ups, developing and releasing 5+ apps"
        ],
        "technologies": ["Swift", "SwiftUI", "iOS"]
      }
    ],
    "projects": {
      "featured": [
        {
          "title": "Strive Planner",
          "category": "Web App",
          "image": "/images/strive-website.png",
          "description": "Full-stack productivity platform built for intentional living — calendar and time tracking, goal-setting, and daily reflection. Native iOS and macOS apps, a web app, and a Phoenix/Elixir backend with real-time sync across every device (Android coming soon).",
          "technologies": ["Swift", "Elixir", "Phoenix"],
          "links": {
            "live": "https://striveplanner.app",
            "website": "https://striveplanner.app"
          }
        },
        {
          "title": "Open Chat",
          "category": "Desktop App",
          "image": "/images/openchat.png",
          "description": "Cross-platform AI chat client with multi-provider support (Anthropic, OpenAI, Ollama). Secure API key management, persistent conversations, modern UI.",
          "technologies": ["Tauri", "React", "TypeScript", "Rust"],
          "links": {
            "website": "https://openchat.weisssolutions.org",
            "github": "https://github.com/MikaelWeiss/openchat"
          }
        },
        {
          "title": "OpSync",
          "category": "iOS & Android App",
          "image": "/images/opsync.png",
          "description": "AI training platform for pest control teams with voice-to-voice role-play and real-time coaching. Built as Lead Developer with team of 3.",
          "technologies": ["SwiftUI", "Voice AI", "OpenAI", "Python"],
          "links": {
            "website": "https://opsyncservices.com",
            "live": "https://apps.apple.com/us/app/opsync/id6743721267"
          }
        },
        {
          "title": "Strive Planner",
          "category": "iOS App",
          "image": "/images/strive.png",
          "description": "Calendar app with iCal recurrence, goal tracking, and person-event relationships. Philosophy: intentionality over productivity. 2,000+ downloads, 5-star rating.",
          "technologies": ["SwiftUI", "SwiftData", "iOS"],
          "links": {
            "live": "https://apps.apple.com/us/app/strive-planner/id6472100413",
            "website": "https://striveplanner.app"
          }
        },
        {
          "title": "Sherpa",
          "category": "iOS App",
          "image": "/images/sherpa.png",
          "description": "Your everyday guide to help you remember the important things and do what matters most. Built for High Country Living, 5-star rating.",
          "technologies": ["SwiftUI", "SwiftData", "iOS"],
          "links": {
            "live": "https://apps.apple.com/us/app/sherpa-your-everday-guide/id6474707966"
          }
        }
      ],
      "all": []
    },
    "awards": [
      {
        "title": "Eagle Scout",
        "year": "2019",
        "description": "Organized 60-volunteer event delivering children's hospital pillow kits, helping children have a fun project during their stay.",
        "icon": "badge"
      }
    ],
    "volunteer": [
      {
        "title": "LDS Mission (Spanish)",
        "organization": "The Church of Jesus Christ of Latter-day Saints",
        "period": "Oct 2021 - Oct 2023",
        "description": "Led missionary teams in training, planning, and goal achievement. Learned systems of goal setting and scheduling that I now implement in Strive Planner.",
        "tags": ["Spanish", "Leadership", "Goal Setting"],
        "icon": "heart"
      }
    ],
    "education": [
      {
        "degree": "Computer Science",
        "school": "Brigham Young University - Idaho",
        "period": "Jan 2024 - Jul 2027",
        "description": "Currently pursuing degree with a 3.9 GPA. President of the Mobile Computing Society and Assistant to the President of the Computing Society.",
        "tags": ["Leadership", "Mobile Computing", "Software Engineering"]
      }
    ]
  }
  """

  def get_all do
    @portfolio_data
    |> Jason.decode!(keys: :atoms)
  end

  def get_personal, do: get_all()[:personal]
  def get_about, do: get_all()[:about]
  def get_skills, do: get_all()[:skills]
  def get_experience, do: get_all()[:experience]
  def get_projects, do: get_all()[:projects]
  def get_awards, do: get_all()[:awards]
  def get_volunteer, do: get_all()[:volunteer]
  def get_education, do: get_all()[:education]

  def get_featured_projects, do: get_all()[:projects][:featured]

  def get_all_projects,
    do: get_all()[:projects][:featured] ++ get_all()[:projects][:all]
end
