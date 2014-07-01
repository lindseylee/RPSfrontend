require 'sinatra'
require_relative './lib/xRPS.rb'


set :bind, '0.0.0.0'

enable :sessions

get '/' do
  # if session[:user_id]
  #   user = 
  # session[:stuff] ||= "morestuff"
  # is the user in the session hash?
  # redirect to erb :user_home
  erb :start
end

get '/signup' do
  erb :signup
end

get '/signin' do
  erb :signin
end

post '/signup' do
  # params = {:username =>, :password => }
  result = RPS.script.sign_up(params)
  if result[:success?]
    @username = params[:username]
    erb :signup_success
  else
    @error = result[:error]
    erb :signup_error
  end
end

post '/signin' do
  # params = {:username =>, :password => }
  result = RPS.script.sign_in(params)
  if result[:success?]
    user = result[:user]
    @username = user.username
    @user_id = user.id
    erb :user_home    
  else
    @error = result[:error]
    erb :signin_error
  end
end

get '/start_match/:userid' do

  @getid = params
  RPS::script.start_match()
  erb :start_match
end

# get 'des/'
#   @first = "adsfadsf"

# =============================================
# design routes =============================
# =============================================
get '/design/user_home' do
  @user = "me"
  # @user = nil
  @first_name = "Lindsey"
  erb :user_home
end

get '/design/start' do
  # @user = "me"
  @user = nil
  erb :start
end

get '/design/signup' do
  @noheader = true
  @user = nil
  erb :signup
end

get '/design/game_play' do
  @user = "me"
  @first_name = "Lindsey"
  @player1 = nil
  @player2 = "is_set"
  erb :game_play
end



