defmodule ShindagameWeb.AdminController do
  use ShindagameWeb, :controller

  def show(conn, %{"user_id" => user_id}) do
    # Retrieve user details (from your database) based on the user_id and assign it to a variable
    user = Shindagame.Accounts.get_user(user_id)

    render(conn, "show.html", user: user)
  end

  def delete(conn, %{"user_id" => user_id}) do
    # Render a confirmation page for soft deleting the user
    # The form submission should trigger the :soft_delete action
    render(conn, "delete.html", user_id: user_id)
  end

  def soft_delete(conn, %{"user_id" => user_id}) do
    # Handle the soft deletion logic here, e.g., mark the user as deleted in the database
    # Redirect to an appropriate page or show a success message
  end

  def index(conn, _params) do
    # Retrieve profit-related information (from your database) and assign it to a variable
    profit_info = Shindagame.Profit.get_profit_information()

    render(conn, "index.html", profit_info: profit_info)
  end
end
