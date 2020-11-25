class AddAvgRatingToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :avg_rating, :integer
  end
end
