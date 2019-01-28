class TreesController < ApplicationController

	get '/trees/new' do
	  erb :'/trees/new'
	end

	post '/trees' do
	  if !logged_in?
	  	redirect '/'
	  end

	  if form_is_filled
	  	flash[:message] = "Your tree was successfully created"
	  	@tree = Tree.create(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight], homeowner_id: current_user.id)
	  	redirect "/trees/#{@tree.id}"
	  else
	  	flash[:errors] = "All fields must be filled in to add a tree. If no fruit has been harvested enter 0"
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
	  	  flash[:message] = "Your tree was successfully updated"
	  	  @tree.update(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight])
	  	  redirect "/trees/#{@tree.id}"
	  	else
	  	  flash[:errors] = "Only the Homeowner of this tree can edit this tree"
	  	  redirect "homeowners/#{current_user.id}"
	  	end
	  else
	  	redirect '/'
	  end
	end

	delete '/trees/:id' do 
	  set_tree
	  if authorized_to_edit?(@tree)
	  	flash[:message] = "Your tree was deleted"
	    @tree.destroy
	    redirect "/homeowners/#{current_user.id}"
	  else
	  	flash[:errors]	= "Only the Homeowner of this tree can delete this tree"
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
