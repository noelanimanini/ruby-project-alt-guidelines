class BookOrder < ActiveRecord::Base
    belongs_to :bookstore
    has_many :books
end 