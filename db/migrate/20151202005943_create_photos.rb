class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end