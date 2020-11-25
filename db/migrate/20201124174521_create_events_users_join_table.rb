class CreateEventsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :users
  end
end
