defmodule Shindagame.Repo.Migrations.Games do
  use Ecto.Migration

  def change do
    create table(:games) do
      # add :id, :integer
      add :name, :string
      add :date, :utc_datetime
      add :teams, :string

      timestamps()
  end
end
end
