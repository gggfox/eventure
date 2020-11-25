class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :event
    validates :user_id, presence: true
    validates :event_id, presence: true
    validates :rate, presence: true
end
