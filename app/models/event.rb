class Event < ApplicationRecord
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

    has_and_belongs_to_many :users
    has_many :comments, dependent: :destroy
    has_many :ratings,  dependent: :destroy

    validates :title, presence: true, length: { maximum: 50 }
    validates :location, presence: true, length: { minimum: 2}
    validates :desc, presence: true, length: { maximum: 255 }
    validates :price, presence: true
end
