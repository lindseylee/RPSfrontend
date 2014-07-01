require 'spec_helper'



describe 'Script' do

    it "creates a new match and sets the user to player 1" do
      input = {:user_id => "some_userID"}
      match = RPS.script.run_start_match(input)
      expect(match.player1).to eq('some_userID')
    end

    it "allows a user to join a game" do 
      match = RPS::Match.new()
      input = {:user => "some_userID", :match => match}
      RPS.script.run_join_match(input)
      expect(match.player2).to eq("some_username")
    end

    it "starts a game" do

    end

end # Script end





