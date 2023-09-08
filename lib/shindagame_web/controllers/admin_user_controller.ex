defmodule ShindagameWeb.AdminUserController do
  use ShindagameWeb, :controller

  # The index action to list users
  def index(conn, _params) do
    # Check if the current user has admin or superuser role
    case authorized?(conn, [:admin_access, :superuser_access]) do
      true ->
        # Authorized, perform the action
        users = Shindagame.Accounts.User.list_users()
        render(conn, "index.html", users: users)

      false ->
        # Unauthorized, redirect or display an error message
        conn
        |> put_flash(:error, "Unauthorized access")
        |> redirect(to: "/")
    end
  end

  # Other actions for user management, such as granting/revoking admin access

  defp authorized?(conn, roles) do
    # Check if the current user has one of the specified roles
    user = Guardian.Plug.current_resource(conn)
    Enum.any?(roles, fn role -> user.role == role end)
  end
end
