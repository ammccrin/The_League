class AddLeagueidToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :league_id, :integer
  end
end
