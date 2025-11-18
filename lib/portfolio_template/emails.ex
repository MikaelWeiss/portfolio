defmodule PortfolioTemplate.Emails do
  @moduledoc """
  Email templates for the application.
  """

  import Swoosh.Email

  @doc """
  Sends a magic link email to the admin for authentication.
  """
  def magic_link_email(email, token) do
    # Use environment variable for base URL in production, default for development
    base_url = System.get_env("PHX_HOST") || "localhost:4000"
    scheme = if base_url == "localhost:4000", do: "http", else: "https"
    url = "#{scheme}://#{base_url}/admin/verify?token=#{token}"

    new()
    |> to(email)
    |> from({"Mikael Weiss", "noreply@mikaelweiss.dev"})
    |> subject("Your Admin Login Link")
    |> html_body("""
    <html>
      <body style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
        <h1 style="color: #333;">Login to Your Admin Panel</h1>
        <p style="color: #666; font-size: 16px;">Click the link below to log in to your admin dashboard (expires in 5 minutes):</p>
        <p style="margin: 30px 0;">
          <a href="#{url}" style="background-color: #4F46E5; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; display: inline-block;">
            Login to Admin
          </a>
        </p>
        <p style="color: #999; font-size: 14px;">If you didn't request this login link, you can safely ignore this email.</p>
      </body>
    </html>
    """)
    |> text_body("""
    Login to Your Admin Panel

    Click the link below to log in (expires in 5 minutes):
    #{url}

    If you didn't request this login link, you can safely ignore this email.
    """)
  end

  @doc """
  Sends a subscription verification email.
  """
  def subscriber_verification_email(email, token) do
    base_url = System.get_env("PHX_HOST") || "localhost:4000"
    scheme = if base_url == "localhost:4000", do: "http", else: "https"
    url = "#{scheme}://#{base_url}/verify-subscription?token=#{token}"

    new()
    |> to(email)
    |> from({"Mikael Weiss", "noreply@mikaelweiss.dev"})
    |> subject("Confirm Your Subscription")
    |> html_body("""
    <html>
      <body style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
        <h1 style="color: #333;">Confirm Your Email</h1>
        <p style="color: #666; font-size: 16px;">Thanks for subscribing to my blog! Click below to confirm your email address:</p>
        <p style="margin: 30px 0;">
          <a href="#{url}" style="background-color: #4F46E5; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; display: inline-block;">
            Confirm Subscription
          </a>
        </p>
        <p style="color: #999; font-size: 14px;">If you didn't subscribe to this blog, you can safely ignore this email.</p>
      </body>
    </html>
    """)
    |> text_body("""
    Confirm Your Email

    Thanks for subscribing! Click the link below to confirm your email:
    #{url}

    If you didn't subscribe, you can safely ignore this email.
    """)
  end

  @doc """
  Sends a new blog post notification to subscribers.
  """
  def new_post_notification(email, post, unsubscribe_token) do
    base_url = System.get_env("PHX_HOST") || "localhost:4000"
    scheme = if base_url == "localhost:4000", do: "http", else: "https"
    post_url = "#{scheme}://#{base_url}/blog/#{post.slug}"
    unsubscribe_url = "#{scheme}://#{base_url}/unsubscribe?token=#{unsubscribe_token}"

    excerpt = post.excerpt || String.slice(post.content, 0, 200) <> "..."

    new()
    |> to(email)
    |> from({"Mikael Weiss", "noreply@mikaelweiss.dev"})
    |> subject("New Post: #{post.title}")
    |> html_body("""
    <html>
      <body style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
        <h1 style="color: #333;">#{post.title}</h1>
        <p style="color: #666; font-size: 16px;">#{excerpt}</p>
        <p style="margin: 30px 0;">
          <a href="#{post_url}" style="background-color: #4F46E5; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; display: inline-block;">
            Read More
          </a>
        </p>
        <hr style="border: none; border-top: 1px solid #eee; margin: 40px 0;" />
        <p style="color: #999; font-size: 12px;">
          <a href="#{unsubscribe_url}" style="color: #999;">Unsubscribe</a>
        </p>
      </body>
    </html>
    """)
    |> text_body("""
    #{post.title}

    #{excerpt}

    Read more: #{post_url}

    ---
    Unsubscribe: #{unsubscribe_url}
    """)
  end
end
