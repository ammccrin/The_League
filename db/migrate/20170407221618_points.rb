class Points < ActiveRecord::Migration[5.0]
  def change
  	create_table :points do |t|
    	t.integer :points, null: false
    	t.references :week, null: false
    	t.references :team, null: false
    	    	
      t.timestamps
    end
  end
end
