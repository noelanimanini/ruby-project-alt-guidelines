class Book < ActiveRecord::Base
    belongs_to :book_orders
    has_many :bookstores, through: :book_orders
end 