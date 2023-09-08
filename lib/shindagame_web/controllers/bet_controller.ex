# defmodule ShindagameWeb.BetController do
#   use ShindagameWeb, :controller
#   import Ecto.Changeset

#   alias Shindagame.Bet
#   alias Shindagame.Accounts.User

#   def new(conn, _params) do
#     render(conn, "new.html")
#   end

#   def create(conn, %{"bet" => bet_params}) do
#     user = current_user()
#     game = get_game_from_params(bet_params)

#     {valid_bet, error_message} = validate_and_check_balance(user, game, bet_params)

#     if valid_bet do
#       bet_changeset = Shindagame.Bets.Bet.changeset(%Shindagame.Bets.Bet{}, Map.put(bet_params, "user_id", user.id) |> Map.put("game_id", game.id))

#       case Repo.insert(bet_changeset) do
#         {:ok, _bet} ->
#           Shindagame.Accounts.User.update_balance(user, -bet_params["amount"])

#           conn
#           |> put_flash(:info, "Bet cancelled successfully")
#           |> redirect(to: bet_path(conn, :index))

#         {:error, changeset} ->
#           conn
#           |> put_flash(:error, "Failed to place bet")
#           |> render("new.html", changeset: changeset)
#       end

#     else
#       conn
#       |> put_flash(:error, "Invalid bet or insufficient balance: #{error_message}")
#       |> redirect(to: bet_path(conn, :new))
#     end
#   end

#   def cancel(conn, _params) do
#     render(conn, "cancel.html")
#   end

#   def cancel_bet(conn, %{"bet_id" => bet_id}) do
#     user = current_user()
#     bet = get_bet_from_params(bet_id)

#     if can_cancel_bet?(bet) do
#       Bet.cancel_bet(bet)

#       User.update_balance(user, bet.amount)
#       conn
#       |> put_flash(:info, "Bet cancelled successfully")
#       |> redirect(to: bet_path(conn, :index))
#     else
#       conn
#       |> put_flash(:error, "cancelling bet is not allowed at this time!")
#       |> redirect(to: bet_path(conn, :index))
#     end
#   end

#   def history(conn, _params) do
#     betting_history = Shindagame.Bets.Bet.get_user_betting_history(user_id)

#     render(conn, "history.html", betting_history: betting_history)
#   end
# end
