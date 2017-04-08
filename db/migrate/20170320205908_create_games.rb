class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
    	t.references :match, null: false
    	t.integer :game_num

      t.timestamps
    end
  end
end
