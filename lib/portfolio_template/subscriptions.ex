defmodule PortfolioTemplate.Subscriptions do
  @moduledoc """
  The Subscriptions context.
  """

  import Ecto.Query, warn: false
  alias PortfolioTemplate.Repo
  alias PortfolioTemplate.Subscriptions.Subscriber

  @doc """
  Subscribes a new email address.

  Returns {:ok, subscriber} if successful.
  Returns {:error, changeset} if the email is invalid or already exists.
  """
  def subscribe(email) do
    %Subscriber{}
    |> Subscriber.changeset(%{email: email})
    |> Subscriber.generate_tokens()
    |> Repo.insert()
  end

  @doc """
  Verifies a subscriber's email using their verification token.

  Returns {:ok, subscriber} if successful.
  Returns {:error, :not_found} if the token doesn't exist.
  Returns {:error, :already_verified} if already verified.
  """
  def verify_subscriber(token) do
    case Repo.get_by(Subscriber, verification_token: token) do
      nil ->
        {:error, :not_found}

      %Subscriber{verified: true} = _subscriber ->
        {:error, :already_verified}

      subscriber ->
        subscriber
        |> Subscriber.changeset(%{
          verified: true,
          verified_at: DateTime.utc_now() |> DateTime.truncate(:second)
        })
        |> Repo.update()
    end
  end

  @doc """
  Unsubscribes an email using their unsubscribe token.

  Returns {:ok, subscriber} if successful.
  Returns {:error, :not_found} if the token doesn't exist.
  """
  def unsubscribe(token) do
    case Repo.get_by(Subscriber, unsubscribe_token: token) do
      nil ->
        {:error, :not_found}

      subscriber ->
        subscriber
        |> Subscriber.changeset(%{unsubscribed: true})
        |> Repo.update()
    end
  end

  @doc """
  Returns all verified and active (not unsubscribed) subscribers.
  """
  def list_active_subscribers do
    Repo.all(
      from s in Subscriber,
        where: s.verified == true and s.unsubscribed == false
    )
  end

  @doc """
  Returns all subscribers.
  """
  def list_all_subscribers do
    Repo.all(Subscriber)
  end

  @doc """
  Gets a subscriber by email.
  """
  def get_subscriber_by_email(email) do
    Repo.get_by(Subscriber, email: email)
  end
end
