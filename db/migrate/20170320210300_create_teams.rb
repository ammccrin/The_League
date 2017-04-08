class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.string :name, uniqueness: true
    	t.references :league, null: false
      t.timestamps
    end
  end
end
