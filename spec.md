# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
	I am using Sinatra to build this app

- [x] Use ActiveRecord for storing information in a database
	My models use ActiceRecord to store information in the database

- [x] Include more than one model class (e.g. User, Post, Category)
	I have a homeowner model and a tree model

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
	A Homeowner has many trees

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
	A Tree belongs to a Homeowner

- [x] Include user accounts with unique login attribute (username or email)
	Homeowners login attribute is email address
		
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
	Homeowner has full CRUD on trees	

- [x] Ensure that users can't modify content created by other users
	Controller helper method ensures edit and delete actions can only be done by if a Homeowner owns a Tree and won't display edit or delete links if a Homeowner doesn't own the Tree.

- [x] Include user input validations
	Homeowners can't create blank Homeowner or Tree

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
	flash messages display validations to Homeowners

- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

	pending... a short description, and link to MIT licesnse are there

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message