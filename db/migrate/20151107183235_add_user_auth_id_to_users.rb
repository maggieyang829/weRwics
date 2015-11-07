class AddUserAuthIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_auth_id, :integer
  end
end
