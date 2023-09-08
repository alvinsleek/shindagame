defmodule ShindagameWeb.RegistrationController do
  use ShindagameWeb, :controller
  # import Shindagame.TokenGenerator

  # def create(conn, %{"user" => user_params}) do
  #   role = user_params["role"]

  #   # changeset = User.changeset(%User{}, Map.delete(user_params, "role") |> Map.put("role", role))

  #   case Repo.insert(changeset) do
  #     {:ok, _user} ->

  #       {:ok, user} = ShindagameWeb.Guardian.encode_and_sign(user)
  #       conn
  #       |> put_status(:created)
  #       |> render("show.json", user: user, token: token)

  #     {:error, changeset} ->

  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> render(ShindagameWeb.ErrorView, "422.json", changeset: changeset)
  #   end
  # end

end
