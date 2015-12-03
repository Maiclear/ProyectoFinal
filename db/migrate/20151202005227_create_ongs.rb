class CreateOngs < ActiveRecord::Migration
  def change
    create_table :ongs do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :mail
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
