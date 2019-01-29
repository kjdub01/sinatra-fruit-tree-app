class HomeownersController < ApplicationController

  get '/signup' do #(show signup.erb) 
    erb :signup
  end

  post '/homeowners' do 
    @homeowner = Homeowner.new(params)
    if @homeowner.save
      session[:homeowner_id] = @homeowner.id

      redirect "/homeowners/#{@homeowner.id}"
    else
      flash[:errors] = "Account creation failure: #{@Homeowner.errors.full_messages.to_sentence}"
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

  get '/homeowners' do
    redirect_if_not_logged_in 
    @homeowners = Homeowner.all

    erb :'homeowners/index'
  end

  get '/homeowners/:id' do #(show homeowners show.erb)
    redirect_if_not_logged_in
    @homeowner = Homeowner.find_by(id: params[:id])

  	erb :'homeowners/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end