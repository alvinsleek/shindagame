defmodule ShindagameWeb.BetController do
  use ShindagameWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"bet" => bet_params}) do
    user = current_user()
    game = get_game_from_params(bet_params)

    {valid_bet, error_message} = validate_and_check_balance(user, game, bet_params)

    if valid_bet do
      bet = Shindagame.Bets.Bet.changeset(%Bet{}, Map.put(bet_params, "user_id", user.id) |> Map.put("game_id", game.id))

      case Repo.insert(bet) do
        {:ok, _bet} ->
          Shindagame.Accounts.User.update_balance(user, -bet.amount)

        {:error, changeset} ->
      end

    else
      
    end
    # Handle the bet creation logic here, e.g., storing the bet in the database
    # Redirect to the betting history page or show a success message
  end

  def cancel(conn, _params) do
    render(conn, "cancel.html")
  end

  def cancel_bet(conn, %{"bet_id" => bet_id}) do
    # Handle the bet cancellation logic here, e.g., updating the bet status in the database
    # Redirect to the betting history page or show a success message
  end

  def history(conn, _params) do
    # Retrieve the user's betting history (from your database) and assign it to a variable
    # betting_history = Shindagame.Bets.Bet.get_user_betting_history(user_id)

    # render(conn, "history.html", betting_history: betting_history)
  end
end
