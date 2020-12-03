class CreateBookstores < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.string :location
      t.datetime :opening_time
      t.datetime :closing_time
      
    end
  end
end
