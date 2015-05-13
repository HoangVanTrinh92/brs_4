class CreateReadStates < ActiveRecord::Migration
  def change
    create_table :read_states do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :state

      t.timestamps null: false
    end
  end
end
