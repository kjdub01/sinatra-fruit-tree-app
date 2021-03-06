class TreesController < ApplicationController

	get '/trees/new' do
	  redirect_if_not_logged_in
	  erb :'/trees/new'
	end

	post '/trees' do
	  redirect_if_not_logged_in
	  if form_is_filled?
	    flash[:message] = "Your tree was successfully created"
	    @tree = Tree.create(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight], homeowner_id: current_user.id)
	    redirect "/trees/#{@tree.id}"
	  else
	    flash[:errors] = "All fields must be filled in to add a tree. If no fruit has been harvested enter 0"
	    redirect '/trees/new'
	  end
	end

	get '/trees/:id'  do
	  redirect_if_not_logged_in	
	  set_tree

	  if @tree.nil?
	  	redirect "/homeowners"

	  else

	  	erb :'/trees/show'
	  end
	end

	get '/trees/:id/edit' do
	  set_tree
	  redirect_if_not_logged_in
	  if @tree.homeowner == current_user 
	  	erb :'/trees/edit'
	  else flash[:errors] = "You can only edit your trees."
	  	  redirect "/homeowners/#{current_user.id}"
	  end
	end

	patch '/trees/:id' do
	  set_tree
	  redirect_if_not_logged_in
	  if @tree.homeowner == current_user && form_is_filled?
	  	flash[:message] = "Your tree was successfully updated"
	  	@tree.update(variety: params[:variety], size: params[:size], fruit_weight: params[:fruit_weight])
	  	redirect "/trees/#{@tree.id}"
	  else
	  	flash[:errors] = "All fields must be filled."
	  	redirect "/trees/#{@tree.id}/edit"
	  end
	end

	delete '/trees/:id' do 
	  set_tree
	  if authorized_to_edit?(@tree)
	  	flash[:message] = "Your tree was deleted"
	    @tree.destroy
	    redirect "/homeowners/#{current_user.id}"
	  else
	  	redirect "/homeowners/#{current_user.id}"
	  end
	end


	private

	def set_tree
		@tree = Tree.find_by(id: params[:id])
	end

	def form_is_filled?
		params[:variety] != "" && params[:size] != "" && params[:fruit_weight] != ""
	end
end
