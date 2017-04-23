class AddResultsToMatch < ActiveRecord::Migration[5.0]
  def change
  	add_column :matches, :result, :text, array: true, default: []
  end
end
