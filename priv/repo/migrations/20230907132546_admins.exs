defmodule Shindagame.Repo.Migrations.Admins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      # add :id, :integer
      add :user_id, references(:users, on_delete: :delete_all)


      timestamps()
  end
end
end
