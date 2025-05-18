defmodule Senpai.Repo do
  use Ecto.Repo,
    otp_app: :senpai,
    adapter: Ecto.Adapters.Postgres
end
