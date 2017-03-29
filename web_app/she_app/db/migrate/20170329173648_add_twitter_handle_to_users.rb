class AddTwitterHandleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_handle, :string
  end
end
