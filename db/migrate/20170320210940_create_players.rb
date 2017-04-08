class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
    	t.string :name, null: false, uniqueness: true
    	t.references :team, null: false
    	t.references :league, null: false
    	t.integer :average
    	
      t.timestamps
    end
  end
end
