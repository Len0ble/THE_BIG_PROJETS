class Potin < ApplicationRecord
    belongs_to :user
    validates :author, presence: true, length: { minimum: 3, maximum: 14 }
    validates :content, presence: true
end
