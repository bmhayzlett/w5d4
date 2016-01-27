class AddIndexPollsandUsers < ActiveRecord::Migration
  def change
    add_index :users, :user_name, unique: true
    add_index :polls, :author_id
  end
end
