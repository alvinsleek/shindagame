defmodule Shindagame.Repo.Migrations.Bets do
  use Ecto.Migration

  def change do
    create table(:bets) do
      # add :id, :integer
      add :user_id, references(:users, on_delete: :delete_all)
      add :game_id, references(:games, on_delete: :delete_all)

      timestamps()
  end
end
end
