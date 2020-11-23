class DropCategoriesEventsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories_events
  end
end
