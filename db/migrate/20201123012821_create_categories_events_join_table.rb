class CreateCategoriesEventsJoinTable < ActiveRecord::Migration[6.0]
  def change
      create_join_table :categories, :events 
    end
  end
end
