class AddUsernameAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, unique: true
  end
end
