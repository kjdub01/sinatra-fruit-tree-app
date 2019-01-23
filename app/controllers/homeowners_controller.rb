class HomeownerController < ApplicationController

  get '/signup' do 

  end

  get '/login' do #(show login.erb)
  	erb :login
  end


end