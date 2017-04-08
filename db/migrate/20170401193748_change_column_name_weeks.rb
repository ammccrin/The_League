class ChangeColumnNameWeeks < ActiveRecord::Migration[5.0]
  def change
  	rename_column :leagues, :weeks, :num_of_weeks
  end
end
