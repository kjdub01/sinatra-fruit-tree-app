class HomeownersController < ApplicationController

  get '/signup' do #(show signup.erb) 
    erb :signup
  end

  post '/homeowners' do 
    if params[:first_name] != "" && params[:last_name] != "" && params[:email] != "" && params[:password] != ""
      @homeowner = Homeowner.create(params)
      session[:homeowner_id] = @homeowner.id

      redirect "/homeowners/#{@homeowner.id}"
    else
      flash[:errors] = "All fields must be filled out to Sign Up"
      redirect '/signup' #(need to include flash message)
    end
  end

  get '/login' do #(show login.erb)
  	erb :login
  end

  post '/login' do #(setting sessions)
  	@homeowner = Homeowner.find_by(email: params[:email])

  	if @homeowner && @homeowner.authenticate(params[:password])
  		session[:homeowner_id] = @homeowner.id
  	
  		redirect "homeowners/#{@homeowner.id}"
  	else
      flash[:errors] = "Your email or password is inccorect. Please try again or Sign Up to continue"
      redirect "/login"
  	end
  end

  get '/homeowners/:id' do #(show homeowners show.erb)
    @homeowner = Homeowner.find_by(id: params[:id])

  	erb :'homeowners/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end