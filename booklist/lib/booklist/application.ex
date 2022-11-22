defmodule Booklist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Booklist.Repo,
      # Start the Telemetry supervisor
      BooklistWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Booklist.PubSub},
      # Start the Endpoint (http/https)
      BooklistWeb.Endpoint
      # Start a worker by calling: Booklist.Worker.start_link(arg)
      # {Booklist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Booklist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BooklistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
