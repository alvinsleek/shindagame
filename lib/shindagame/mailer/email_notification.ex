defmodule Shindagame.Mailer.EmailNotification do
  use Bamboo.Mailer, otp_app: :shindagame

  # def won_bet_notification(user_email, game_name) do
  #   #  new_email()
  #   |> from("your_email@example.com")
  #   |> to(user_email)
  #   |> subject("Congratulations! You've won a bet!")
  #   |> text_body("You've won your bet on #{game_name}. Congratulations!")
  #   |> html_body("<p>You've won your bet on #{game_name}. Congratulations!</p>")
  # end

  # def lost_bet_notification(user_email, game_name) do
  #   new_email()
  #   |> from("your_email@example.com")
  #   |> to(user_email)
  #   |> subject("Bet Result: #{game_name}")
  #   |> text_body("Unfortunately, you've lost your bet on #{game_name}.")
  #   |> html_body("<p>Unfortunately, you've lost your bet on #{game_name}.</p>")
  # end
end
