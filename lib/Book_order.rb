class BookOrder < ActiveRecord::Base
    belongs_to :bookstores
    has_many :books
end 