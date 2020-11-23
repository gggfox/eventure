class Event < ApplicationRecord
    has_and_belongs_to_many :categories
    
    validates :title, presence: true, length: { maximum: 50 }
    validates :location, presence: true, length: { minimum: 2}
    validates :desc, presence: true, length: { maximum: 255 }
    validates :price, presence: true
end
