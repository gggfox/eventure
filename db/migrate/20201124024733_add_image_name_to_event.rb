class AddImageNameToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image_name, :string
  end
end
