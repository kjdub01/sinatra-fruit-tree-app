class HomeownersController < ApplicationController

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
end