class SessionsController < ApplicationController

  get '/signup' do #(show signup.erb) 
    erb :'sessions/signup'
  end

  post '/homeowners' do 
    @homeowner = Homeowner.new(params)
    if @homeowner.save
      session[:homeowner_id] = @homeowner.id

      redirect "/homeowners/#{@homeowner.id}"
    else
      flash[:errors] = "Account creation failure: #{@homeowner.errors.full_messages.to_sentence}"
      redirect '/signup' #(need to include flash message)
    end
  end

  get '/login' do #(show login.erb)
  	erb :'sessions/login'
  end

  post '/login' do #(setting sessions)
  	@homeowner = Homeowner.find_by(email: params[:email])

  	if @homeowner && @homeowner.authenticate(params[:password])
  		session[:homeowner_id] = @homeowner.id
  	
  		redirect "homeowners/#{@homeowner.id}"
  	else
      flash[:errors] = "Your email or password is incorrect. Please try again or Sign Up to continue"
      redirect "/login"
  	end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end  
end
