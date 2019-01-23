class CreateHomeowners < ActiveRecord::Migration
  def change
  	create_table :homeowners do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password_digest
  		t.timestamps null: false
  	end
  end
end
