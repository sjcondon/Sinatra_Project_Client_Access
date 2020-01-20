require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :method_override, true
    set :session_secret, "whatever"
  end

  get "/" do
    erb :welcome
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
