class Weeks < ActiveRecord::Migration[5.0]
  def change
  	create_table :weeks do |t|
    	t.integer :week, null: false
    	t.references :league, null: false
      t.timestamps
    end
  end
end
