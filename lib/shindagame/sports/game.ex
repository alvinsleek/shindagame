defmodule Shindagame.Sports.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :name, :string
    field :start_time, :naive_datetime
    field :end_time, :naive_datetime
    field :sport_type, :string

    has_many :bets, Shindagame.Bets.Bet

    timestamps()
  end

  @required_fields ~w(name start_time end_time sport_type)
  @optional_fields []

  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :start_time, :end_time, :sport_type])
    |> validate_required(@required_fields)
  end
end
