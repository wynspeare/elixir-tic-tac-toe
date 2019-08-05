defmodule Controller do
  def game_loop({true, game}) do
    Console.display_board(game.board)
    :draw |> Messages.get() |> Console.display()
  end

  def game_loop({false, game}) do
    Console.display_board(game.board)
    :winner |> Messages.get(game.current_player.marker) |> Console.display()
  end

  def game_loop(game) do
    Console.display_board(game.board)

    unless Board.is_filled(game.board) do
      turn(game)
      |> game_loop()
    end
  end

  def get_current_move(game) do
    game.current_player
    |> Strategy.decide(game.board)
    |> Validator.is_valid_move(game.board)
    |> get_current_move(game)
  end

  def get_current_move({false, move}, game) when is_integer(move) do
    Messages.get(:cell_filled)
    |> Console.display()

    get_current_move(game)
  end

  def get_current_move({false, move}, game) do
    Messages.get(:invalid_move, move)
    |> Console.display()

    get_current_move(game)
  end

  def get_current_move({_, valid_move}, game) do
    valid_move
    |> display_move(game.current_player.marker)
    |> Board.place_marker(game.board, game.current_player.marker)
  end

  def turn(game) do
    board = get_current_move(game)

    if Rules.is_over(board, game.current_player.marker) do
      {Rules.is_draw(board, game.current_player.marker), %{game | board: board}}
    else
      player = Controller.switch_player(game.current_player.marker, game)
      %{game | board: board, current_player: player}
    end
  end

  def switch_player(current_player_marker, game) do
    if current_player_marker == game.player_one.marker do
      game.player_two
    else
      game.player_one
    end
  end

  def display_move(cell_location, marker) do
    Messages.get(:show_move, marker, cell_location)
    |> Console.display()

    cell_location
  end

  def get_input(message, marker, io \\ IO) do
    Messages.get(message, marker)
    |> Console.get_input(io)
  end

  def get_input(message) do
    Messages.get(message)
    |> Console.get_input()
  end
end
