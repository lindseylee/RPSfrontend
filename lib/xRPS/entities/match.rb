module RPS
  class Match
    attr_accessor :player1, :player2, :history

    def initialize(player1=nil, player2=nil)
      @player1 = player1
      @player2 = player2
      @history = []
      @open = true
    end

  end
end

# Part 1: Gameplay
# Matches are played asynchronously
    # This means that both players do not have to be playing at the same time. 
    # If player 1 plays "Rock", and player 2 plays "Paper" a day later, everything 
    # should be ok.
# Google asynchronous gameplay definition
# Matches are 3 out of 5 games
# Each game will show a history of the current match
# Example: In game 3, the players will be able to see the picks and results of games 1 and 2.