class Category < ApplicationRecord
    has_and_belongs_to_many :events
    validates :name, presence: true
    validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end