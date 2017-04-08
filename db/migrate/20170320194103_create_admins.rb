class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
    	t.string :username, null: false, uniqueness: true
    	t.string :password_digest, :null => false

      t.timestamps
    end
  end
end
