defmodule Shindagame.Repo.Migrations.Users do
  use Ecto.Migration

    def change do
      create table(:users) do
        # add :id, :string
        add :first_name, :string
        add :last_name, :string
        add :email_address, :string
        add :msisdn, :string
        add :password_hash, :string
        add :role, :string

        timestamps()
    end
  end
end
