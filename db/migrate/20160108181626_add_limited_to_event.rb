class AddLimitedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :limited, :boolean, default: false
  end
end
