class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :post_id
      t.integer :user_id
      t.timestamp :created_at
      t.string :email
      t.string :name , null: false
    end
  end
end
