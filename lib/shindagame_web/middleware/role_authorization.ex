defmodule ShindagameWeb.Middleware.RoleAuthorization do
  import Plug.Conn

  def init(_opts), do: nil

    def call(conn, _opts) do
      case Guardian.Plug.current_resource(conn) do
        %Shindagame.Accounts.User{role: "Frontend Access"} ->
          conn
        %Shindagame.Accounts.User{role: "Admin Access"} ->
          conn
        %Shindagame.Accounts.User{role: "Superuser Access"} ->
          conn
        _ ->
          conn
          |> put_status(:forbidden)
          # |> json(%{error: "Access Forbidden"})
          |> halt()
      end
    end
  end

  # def init(opts), do: opts

  # def call(conn, %{roles: required_roles} = opts) do
  #   user = Guardian.Plug.current_resource(conn)

  #   if user && Enum.any?(required_roles, &(&1 == user.role)) do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "Unauthorized access")
  #     |> redirect(to: "/")
  #   end
# end
