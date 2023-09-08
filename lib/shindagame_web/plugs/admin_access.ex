defmodule ShindagameWeb.Plugs.AdminAccess do
  import Plug.Conn
  import Shindagame.Accounts.User
  import Poison, only: [encode!: 2]

  def init(_opts), do: nil

  def call(conn, _opts) do
    user = get_current_user(conn)

    case user.role do
      "Admin Access" ->
        # Allow access for users with the "Admin Access" role
        conn

      _ ->
        conn
        |> put_status(:forbidden)
        # |> json(%{error: "Access Forbidden"})
        |> halt()
    end
  end

  defp get_current_user(conn) do
    # Implement a function to fetch the current user based on the JWT or session, if applicable
    Guardian.Plug.current_resource(conn)
  end
end
