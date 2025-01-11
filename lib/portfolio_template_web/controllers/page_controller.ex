defmodule PortfolioTemplateWeb.PageController do
  use PortfolioTemplateWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def works(conn, params) do
    filter = Map.get(params, "filter", "all")
    projects = get_projects()
    render(conn, :works, filter: filter, projects: projects)
  end

  # Private functions

  defp get_projects do
    [
      %{
        title: "E-commerce Platform",
        subtitle: "Full-stack E-commerce Solution",
        category: "Web App",
        description:
          "A modern e-commerce platform built with React and Node.js, featuring real-time inventory management, secure payments, and an intuitive admin dashboard.",
        image: "/images/project1.jpg",
        technologies: ["React", "Node.js", "MongoDB", "Stripe"],
        live_url: "#",
        source_url: "#",
        type: "web"
      },
      %{
        title: "Social Media Dashboard",
        subtitle: "Analytics & Management Platform",
        category: "UI/UX",
        description:
          "A comprehensive dashboard for social media management with real-time analytics, scheduling capabilities, and AI-powered content suggestions.",
        image: "/images/project2.jpg",
        technologies: ["Vue.js", "Python", "PostgreSQL", "TailwindCSS"],
        live_url: "#",
        source_url: "#",
        type: "ui"
      },
      %{
        title: "AI Chat Application",
        subtitle: "Intelligent Chat Platform",
        category: "Web App",
        description:
          "A real-time chat application enhanced with AI capabilities for automated responses, sentiment analysis, and language translation.",
        image: "/images/project3.jpg",
        technologies: ["React", "Python", "TensorFlow", "WebSocket"],
        live_url: "#",
        source_url: "#",
        type: "web"
      },
      %{
        title: "Fitness Tracking App",
        subtitle: "Mobile Fitness Solution",
        category: "Mobile",
        description:
          "A comprehensive mobile app for tracking workouts, nutrition, and progress with personalized recommendations and social features.",
        image: "/images/project4.jpg",
        technologies: ["React Native", "Node.js", "Firebase", "Redux"],
        live_url: "#",
        source_url: "#",
        type: "mobile"
      }
    ]
  end
end
