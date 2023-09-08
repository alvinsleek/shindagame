defmodule Shindagame.Repo.Migrations.GameOutcomes do
  use Ecto.Migration

  def change do
    create table(:game_outcomes) do
      # add :id, :integer
      add :game_id, references(:games, on_delete: :delete_all)
  end
end
end
