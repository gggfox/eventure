class AddEventIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :event, null: false, foreign_key: true
  end
end
