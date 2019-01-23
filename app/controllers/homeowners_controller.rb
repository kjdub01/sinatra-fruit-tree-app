class HomeownerController < ApplicationController

  get '/signup' do 

  end

  get '/login' do #(show login.erb)
  	erb :login
  end

  post '/login' do #(setting sessions)
  	@homeowner = Homeowner.find_by(email: params[:email])

  	if @homeowner && @homeowner.authenticate(params[:password])
  		session[:homeowner_id] = @homeowner.id
  	
  		redirect "homeowners/@{homeowner.id}"
  	else

  	end
  end

  get '/homeowners/:id' do 
  	"homeowners show page"
  end
end