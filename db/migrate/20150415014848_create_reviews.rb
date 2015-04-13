class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :books

    add_index :reviews, [:user_id, :created_at]
    add_index :reviews, [:book_id, :created_at]
  end
end
