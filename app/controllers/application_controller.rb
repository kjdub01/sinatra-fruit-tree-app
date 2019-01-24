require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "magpie"
  end

  get "/" do
    if logged_in?
      redirect "homeowners/:id"
    else
      erb :welcome 
    end
  end

  helpers do 

  	def logged_in?
  		!!current_user
  	end

  	def current_user
  		@current_homeowner ||= Homeowner.find_by(id: session[:homeowner_id])
  	end
  end
end
