class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.timestamp :day
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :spot
      t.references :ong, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
