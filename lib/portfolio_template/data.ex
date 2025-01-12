defmodule PortfolioTemplate.Data do
  @portfolio_data """
  {
    "personal": {
      "name": "Mikael Weiss",
      "title": "App Developer • Entrepreneur • Pilot • Engineer",
      "expertise": ["Swift", "SwiftData", "SwiftUI", "UIKit"],
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
      "description": "I am a passionate iOS developer focused on creating intuitive and impactful mobile applications. With deep expertise in Swift and SwiftUI, I specialize in building performant, scalable apps that delight users. I thrive on leveraging cutting-edge technologies to solve complex problems while maintaining clean, maintainable code.",
      "stats": [
        {
          "value": "3+",
          "label": "Years Experience"
        },
        {
          "value": "20+",
          "label": "Projects Completed"
        }
      ]
    },
    "skills": {
      "frontend": {
        "title": "iOS Development",
        "items": [
          {
            "name": "SwiftUI",
            "years": "3 years",
            "proficiency": 100
          },
          {
            "name": "UIKit",
            "years": "2 years",
            "proficiency": 75
          }
        ]
      },
      "backend": {
        "title": "Web Development",
        "items": [
          {
            "name": "Elixir/Phoenix",
            "years": "1 year",
            "proficiency": 50
          },
          {
            "name": "PostgreSQL",
            "years": "1 year",
            "proficiency": 50
          }
        ]
      },
      "other": {
        "title": "Other Skills",
        "items": ["Git", "GitHub", "SwiftData", "Combine", "Xcode", "Architecture", "Spanish"]
      }
    },
    "experience": [
      {
        "title": "iOS Mobile Developer Intern",
        "company": "Family Search",
        "period": "Jan 2025 - Current",
        "description": [
          "Worked on the FamilySearch iOS app",
          "Applied state-of-the-art API's including SwiftUI"
        ],
        "technologies": ["SwiftUI", "iOS", "APIs"]
      },
      {
        "title": "Chief Executive Officer & Lead Developer",
        "company": "Weiss Solutions LLC",
        "period": "Oct 2023 - Current",
        "description": [
          "Built 'Sherpa' iOS app from ground zero to App Store in 2 months",
          "Co-developed a system for quickly building iOS apps with good architecture",
          "Applied state-of-the-art API's including SwiftUI and SwiftData"
        ],
        "technologies": ["SwiftUI", "SwiftData", "iOS"]
      },
      {
        "title": "iOS App Developer",
        "company": "Elements Financial",
        "period": "Aug 2020 - Jun 2021",
        "description": [
          "Cooperated with other developers to separate and perform tasks based on priorities",
          "Collaborated with a cross-functional team, including designers and full-stack developers",
          "Resolved a set of 56 bugs in the span of a month as estimated"
        ],
        "technologies": ["Swift", "iOS", "UIKit"]
      }
    ],
    "projects": {
      "featured": [
        {
          "title": "Sherpa",
          "category": "iOS App",
          "image": "/images/sherpa.jpeg",
          "description": "Built from ground zero to App Store in 2 months",
          "technologies": ["SwiftUI", "SwiftData", "iOS"],
          "links": {
            "live": "https://apps.apple.com/us/app/sherpa-your-everday-guide/id6474707966"
          }
        },
        {
          "title": "Strive",
          "category": "iOS App",
          "image": "/images/strive.png",
          "description": "Personal project to help me stay on top of my goals.",
          "technologies": ["SwiftUI", "iOS", "SwiftData"],
          "links": {
            "live": "https://apps.apple.com/us/app/strive-planner/id6472100413"
          }
        },
        {
          "title": "Portfolio Website",
          "category": "Web Dev",
          "image": "/images/rachelweiss.png",
          "description": "Built a portfolio website for my sister Rachel to showcase her work and skills.",
          "technologies": ["Astro", "LLM", "CSS"],
          "links": {
            "live": "https://rachelweiss.me",
            "github": "https://github.com/MikaelWeiss/rachel-portfolio"
          }
        },
        {
          "title": "Strive Planner Website",
          "category": "Web Dev",
          "image": "/images/striveplanner.png",
          "description": "Built a website for my personal project Strive Planner to showcase its features and capabilities.",
          "technologies": ["Elixir", "Phoenix", "TailwindCSS"],
          "links": {
            "live": "https://striveplanner.org",
            "github": "https://github.com/MikaelWeiss/striveplanner"
          }
        }
      ],
      "all": [
        {
          "title": "Inventory",
          "category": "iOS App",
          "image": "/images/inventory.jpeg",
          "description": "Personal project made to help small business keep track of their inventory.",
          "technologies": ["SwiftUI", "iOS", "SwiftData"],
          "links": {
            "live": "https://apps.apple.com/us/app/inventory-projects-organizer/id1581850111",
            "github": "https://github.com/Fifty6-Inc/Inventory"
          }
        }
      ]
    },
    "awards": [
      {
        "title": "Eagle Scout",
        "year": "2019",
        "description": "Assembled and delivered pillow kits for children at Children's Hospital, organizing an event with 60 volunteers",
        "icon": "badge"
      }
    ],
    "volunteer": [
      {
        "title": "LDS Church Missionary",
        "organization": "LDS Church",
        "period": "Oct 2021 - Oct 2023",
        "description": "Collaborated with diverse populations in Kansas, Colorado, and Oklahoma, providing support and promoting cultural understanding while leading a small group of missionaries",
        "tags": ["Spanish", "Leadership", "Cultural Understanding"],
        "icon": "heart"
      }
    ],
    "education": [
      {
        "degree": "Computer Science",
        "school": "Brigham Young University - Idaho",
        "period": "Jan 2024 - May 2027",
        "description": "Currently pursuing degree with a 3.9 GPA. Coursework includes C#, Electronic Systems, MySQL, and Web Development",
        "tags": ["C#", "MySQL", "Web Development", "HTML", "CSS"]
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
