class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
    	t.string :name, uniqueness: true, null: false
    	t.integer :weeks, null: false
    	t.string :playoffs, null: false
    	t.string :password, null: false
    	t.integer :curr_week
    	t.references :admin, null: false

      t.timestamps
    end
  end
end
