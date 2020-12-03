class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :genre
      t.integer :rating
      
    end 
  end
end
