class AddFriendColumn < ActiveRecord::Migration[7.0]
  def change
    add_column  :messages, :friend_id, :integer
  end
end
