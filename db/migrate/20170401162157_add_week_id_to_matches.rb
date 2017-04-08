class AddWeekIdToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :week_id, :integer
  end
end
