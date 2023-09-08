defmodule Shindagame.Repo.Migrations.Superusers do
  use Ecto.Migration

  def change do
    create table(:superusers) do
      # add :id, :integer
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
