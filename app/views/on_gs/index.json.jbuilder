json.array!(@ongs) do |ong|
  json.extract! ong, :id, :name, :description, :image, :mail, :user_id
  json.url ong_url(ong, format: :json)
end
