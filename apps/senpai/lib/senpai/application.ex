defmodule Senpai.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Senpai.Repo,
      {DNSCluster, query: Application.get_env(:senpai, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Senpai.PubSub},
      {Oban, Application.fetch_env!(:senpai, Oban)}
      # Start a worker by calling: Senpai.Worker.start_link(arg)
      # {Senpai.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Senpai.Supervisor)
  end
end
