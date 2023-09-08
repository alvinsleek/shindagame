defmodule Shindagame.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do

        create table(:users) do
          add :first_name, :string
          add :last_name, :string
          add :email, :string, null: false
          add :msisdn, :string
          add :password_hash, :string, null: false
          add :role, :string, default: "Frontend Access"

          timestamps()
        end

        create index(:users, [:email], unique: true)

  end
end
