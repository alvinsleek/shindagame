defmodule ShindagameWeb.GameController do
  use ShindagameWeb, :controller

  def index(conn, _params) do

    games = Shindagame.Game.list_games()

    render(conn, "index.html", games: games)
  end
end
