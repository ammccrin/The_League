class AddGamesColumnToLeagues < ActiveRecord::Migration[5.0]
  def change
  	add_column :leagues, :games_per_match, :integer
  end
end
