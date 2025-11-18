defmodule PortfolioTemplateWeb.SubscriptionController do
  use PortfolioTemplateWeb, :controller

  alias PortfolioTemplate.{Subscriptions, Emails, Mailer}

  def create(conn, %{"email" => email}) do
    case Subscriptions.subscribe(email) do
      {:ok, subscriber} ->
        email
        |> Emails.subscriber_verification_email(subscriber.verification_token)
        |> Mailer.deliver()

        conn
        |> put_flash(:info, "Thanks for subscribing! Please check your email to confirm.")
        |> redirect(to: ~p"/blog")

      {:error, changeset} ->
        conn
        |> put_flash(:error, "There was an error with your subscription. Please try again.")
        |> redirect(to: ~p"/blog")
    end
  end

  def verify(conn, %{"token" => token}) do
    case Subscriptions.verify_subscriber(token) do
      {:ok, _subscriber} ->
        conn
        |> put_flash(:info, "Your subscription has been confirmed! You'll receive notifications about new posts.")
        |> redirect(to: ~p"/blog")

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Invalid verification link.")
        |> redirect(to: ~p"/blog")

      {:error, :already_verified} ->
        conn
        |> put_flash(:info, "Your subscription is already confirmed.")
        |> redirect(to: ~p"/blog")
    end
  end

  def unsubscribe(conn, %{"token" => token}) do
    case Subscriptions.unsubscribe(token) do
      {:ok, _subscriber} ->
        render(conn, :unsubscribe_success)

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Invalid unsubscribe link.")
        |> redirect(to: ~p"/blog")
    end
  end
end
