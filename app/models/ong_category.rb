class OngCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :ong

  validates :ong_id, uniqueness: {scope: :category_id}
end
