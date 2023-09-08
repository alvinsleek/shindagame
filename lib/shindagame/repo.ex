defmodule Shindagame.Repo do
  use Ecto.Repo,
    otp_app: :shindagame,
    adapter: Ecto.Adapters.Postgres
end
