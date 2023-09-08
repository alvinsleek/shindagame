defmodule Shindagame.Repo.Migrations.CreateBetsTable do
  use Ecto.Migration

  def change do
    create table(:bets) do
      add :amount, :decimal
      add :status, :string, default: "Placed"
      add :user_id, references("users", on_delete: :nothing, on_update: :cascade)
      add :game_id, references("games", on_delete: :nothing, on_update: :cascade)

      timestamps()
    end

    create index(:bets, [:user_id])
    create index(:bets, [:game_id])
  end
end
