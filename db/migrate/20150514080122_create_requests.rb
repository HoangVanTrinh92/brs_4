class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|      
      t.integer :user_id
      t.string :book_name
      t.string :attr_state
      t.string :book_link

      t.timestamps null: false
    end
  end
end
