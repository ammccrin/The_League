class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
    	t.references :player, null: false
    	t.references :game, null: false
    	t.integer :score, null: false

      t.timestamps
    end
  end
end
