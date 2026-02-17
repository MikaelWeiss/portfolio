defmodule PortfolioTemplate.Data do
  @portfolio_data """
  {
    "personal": {
      "name": "Mikael Weiss",
      "title": "iOS Developer • Entrepreneur • Pilot",
      "expertise": ["Swift", "SwiftUI", "SwiftData", "Voice AI"],
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
      "description": "iOS Developer with 5+ years of experience building innovative mobile applications. Led technical teams, architected complex real-time AI voice systems, and shipped 5+ iOS apps with 1,500+ downloads. Expert in SwiftUI, code architecture, and AI-augmented development workflows.",
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
        "title": "iOS Development",
        "items": [
          {
            "name": "SwiftUI",
            "years": "5 years",
            "proficiency": 100
          },
          {
            "name": "UIKit",
            "years": "3 years",
            "proficiency": 80
          }
        ]
      },
      "backend": {
        "title": "Backend & Tools",
        "items": [
          {
            "name": "Python/FastAPI",
            "years": "1 year",
            "proficiency": 60
          },
          {
            "name": "Elixir/Phoenix",
            "years": "1 year",
            "proficiency": 65
          },
          {
            "name": "Supabase",
            "years": "1 year",
            "proficiency": 70
          }
        ]
      },
      "other": {
        "title": "Other Skills",
        "items": ["Voice AI Integration", "OpenAI APIs", "SwiftData", "WCAG Accessibility", "Clean Architecture", "Team Leadership", "Spanish"]
      }
    },
    "experience": [
      {
        "title": "Lead Developer",
        "company": "OpSync Services LLC",
        "period": "Mar 2025 - Nov 2025",
        "description": [
          "Built iOS and Android app for pest control technicians with AI chatbot and voice-to-voice role-play",
          "Solved complex PCM audio streaming challenge for real-time OpenAI TTS integration",
          "Led remote team of 3, established CI/CD with Xcode Cloud, deployed updates 1-2x weekly"
        ],
        "technologies": ["SwiftUI", "Voice AI", "OpenAI", "Python", "Supabase"]
      },
      {
        "title": "iOS Developer Intern",
        "company": "FamilySearch",
        "period": "Jan 2025 - Apr 2025",
        "description": [
          "Modernized Swift code to use async/await affecting 10,000+ lines of code, fixing 100+ related bugs",
          "Enhanced WCAG accessibility fixing 100+ related issues affecting thousands of customers daily"
        ],
        "technologies": ["Swift", "Async/Await", "Accessibility"]
      },
      {
        "title": "Founder & Lead iOS Developer",
        "company": "Weiss Solutions LLC",
        "period": "Oct 2023 - Present",
        "description": [
          "Launched 5+ iOS apps for clients including High Country Living, Bryce Labs, and AskElephant",
          "Developed Strive Planner iOS app: 2,000+ downloads, 5-star rating",
          "Created reusable architecture system for rapidly building new iOS apps with consistent quality"
        ],
        "technologies": ["SwiftUI", "SwiftData", "Clean Architecture"]
      },
      {
        "title": "iOS App Developer",
        "company": "Elements Financial",
        "period": "Aug 2020 - Jun 2021",
        "description": [
          "Collaborated with cross-functional team including designers, developers, and marketing",
          "Started as unpaid intern and ended as contractor"
        ],
        "technologies": ["Swift", "iOS", "UIKit"]
      }
    ],
    "projects": {
      "featured": [
        {
          "title": "Lunch Ninja",
          "category": "Web App",
          "image": "/images/lunchninja.png",
          "description": "Campus community platform that randomly pairs professors and students for weekly lunch. Passwordless magic-link auth, smart matching algorithm, and multi-tenant architecture built for universities.",
          "technologies": ["Elixir", "Phoenix", "LiveView", "Supabase"],
          "links": {}
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
            "website": "https://striveplanner.org"
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
