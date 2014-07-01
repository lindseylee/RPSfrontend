require "spec_helper"

describe 'Game' do
      
  before do
    player1 = :blah
    player2 = :bloo
    @game = RPS::Game.new(player1, player2)
  end

  it "produces a winner or a tie" do
    move1 = :scissors
    move2 = :rock
    result = @game.play(move1, move2)
    expect(result).to equal(:rock)

    move1 = :rock
    move2 = :rock
    result = @game.play(move1, move2)
    expect(result).to equal(:tie)    
  end

end