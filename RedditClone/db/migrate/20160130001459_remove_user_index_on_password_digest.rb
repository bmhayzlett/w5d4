class RemoveUserIndexOnPasswordDigest < ActiveRecord::Migration
  def change
    remove_index :users, :password_digest
  end
end
