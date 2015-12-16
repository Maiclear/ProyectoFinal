class Category < ActiveRecord::Base
  has_many :ong_categories, dependent: :destroy
  has_many :ongs, through: :ong_categories

end
