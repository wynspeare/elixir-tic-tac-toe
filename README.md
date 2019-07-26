# Elixir TicTacToe

## Installation

Download or clone this repository with the "clone or download" button at the top of this page. 

This project was built in Elixir and uses [mix](https://hexdocs.pm/mix/Mix.html#content) to start the game and run the accompanying test suite. To run this application you'll first need to install Elixir (which comes with mix) from this page [here](https://elixir-lang.org/install.html). Once installed you can run the commands detailed below from the project's root directory. 

Run the following to install the dependencies:
```mix deps.get```

## Testing
Navigate to this project's directory and run the following mix command:
```mix test```

To view the test coverage run this command:
```mix test --cover```

## Starting the Game

Run the following mix command to build an executable of the game:
```mix escript.build```

Then run this command to play the game:
```./tic_tac_toe```