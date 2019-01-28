class TreesController < ApplicationController

	get '/trees/new' do
	  erb :'/trees/new'
	end

	post '/trees' do
	  if !logged_in?
	  	redirect '/'
	  end

	  if form_is_filled
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
	  	if @tree.homeowner == current_user && form_is_filled
	  	  @tree.update(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight])
	  	  redirect "/trees/#{@tree.id}"
	  	else
	  	  redirect "homeowners/#{current_user.id}"
	  	end
	  else
	  	redirect '/'
	  end
	end

	delete '/trees/:id' do 
	  set_tree
	  if authorized_to_edit?(@tree)
	    @tree.destroy
	    redirect "/homeowners/#{current_user.id}"
	  else
	  	redirect "/homeowners/#{current_user.id}"
	  end
	end


	private

	def set_tree
		@tree = Tree.find(params[:id])
	end

	def form_is_filled
		params[:variety] != "" && params[:size] != "" && params[:fruit_weight] != ""
	end
end
