class AddWeekIdToScores < ActiveRecord::Migration[5.0]
  def change
  	add_column :scores, :week_id, :integer
  end
end
