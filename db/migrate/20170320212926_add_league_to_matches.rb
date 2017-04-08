class AddLeagueToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :league_id, :integer
  end
end
