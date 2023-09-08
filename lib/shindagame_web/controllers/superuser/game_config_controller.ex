defmodule ShindagameWeb.GameConfigController do
  use ShindagameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def configure(conn, %{"game" => game_params}) do
    # Handle the sport game configuration logic here, e.g., updating game settings in the database
    # Redirect to an appropriate page or show a success message
  end
end
