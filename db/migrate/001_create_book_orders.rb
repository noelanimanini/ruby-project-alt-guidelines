class CreateBookOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :book_orders do |t|
      t.integer :bookstore_id
      t.integer :book_id
    end 
  end
end
