class CategoryEvent < ApplicationRecord
    belongs_to :category
    belongs_to :event
    #push()
    #delete()
end