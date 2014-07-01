module RPS
  class Game
    attr_accessor :player1, :player2, :winner, :rules

    def initialize(player1, player2)
      @player2 = player1
      @player2 = player2
      @rules = {:rock => :scissors,             # key beats value
                :scissors => :paper,
                :paper => :rock}
      @winner = :tbd
    end 

    def play(move1, move2)          # player parameters instead?
      if @rules[move1] == move2
        return move1
      elsif @rules[move2] == move1
        return move2
      elsif @rules[move2] == @rules[move1]
        return :tie
      end
    end 

  end # class end
end # module end

# win best of three rounds