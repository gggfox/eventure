class AddUserIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :user, null: false, foreign_key: true
  end
end
