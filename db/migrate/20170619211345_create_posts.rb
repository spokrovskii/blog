class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
     t.string :title, null: false
     t.string :content, null: false
     t.timestamp :created_at
     t.timestamp :updated_at
     t.integer :user_id
     t.integer :comment_id
    end
  end
end
