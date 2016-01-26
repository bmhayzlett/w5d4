class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :poll_id, null: false

      t.timestamps
    end

    add_index :questions, :poll_id, :unique => true
  end
end
