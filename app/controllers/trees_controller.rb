class TreesController < ApplicationController

	get '/trees/new' do
	  erb :'/trees/new'
	end

	post '/trees' do
	  if !logged_in?
	  	redirect '/'
	  end

	  if params[:vareity] != "" && params[:size] != "" && params[:fruit_weight] != ""
	  	@tree = Tree.create(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight], homeowner_id: current_user.id)
	  	redirect "/trees/#{@tree.id}"
	  else
	  	redirect '/trees/new'
	  end
	end

	get '/trees/:id'  do	
	  set_tree
	  erb :'/trees/show'
	end

	get '/trees/:id/edit' do
		set_tree
		if logged_in?
	  	  if @tree.homeowner == current_user
	  	    erb :'/trees/edit'
	  	  else
	  	    redirect "homeowners/#{current_user.id}"
	  	  end
	    else
	  	  redirect '/'
	  end
	end

	patch '/trees/:id' do
	  set_tree
	  if logged_in?
	  	if @tree.homeowner == current_user
	  	  @tree.update(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight])
	  	  redirect "/trees/#{@tree.id}"
	  	 else
	  	   redirect "homeowners/#{current_user.id}"
	  	end
	  else
	  	redirect '/'
	  end
	end


	private

	def set_tree
		@tree = Tree.find(params[:id])
	end
end
