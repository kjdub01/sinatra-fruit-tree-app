class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|

      t.timestamps null: false
    end
  end
end
