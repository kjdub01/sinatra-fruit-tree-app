class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
    	t.string :variety
     	t.string :size
     	t.string :fruit_weight
     	t.timestamps null: false
    end
  end
end
