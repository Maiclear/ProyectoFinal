class AddCampoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :city, :string
    add_column :events, :country, :string
  end
end
