class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
    	t.string :variety
     	t.string :size
     	t.integer :fruit_weight
     	t.integer :homeowner_id
     	t.timestamps null: false
    end
  end
end
