defmodule Shindagame.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bets" do
    field :amount, :decimal
    field :status, :string, default: "Placed"
    belongs_to :user, Shindagame.Accounts.User
    belongs_to :game, Shindagame.Sports.Game

    timestamps()
  end

  @required_fields ~w(amount user_id game_id)
  @optional_fields []

  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [:amount, :status, :user_id, :game_id])
    |> validate_required(@required_fields)
  end
end
