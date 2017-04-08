class ChangeDefaultValueOfCurrWeek < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :leagues, :curr_week, 1
  end
end
