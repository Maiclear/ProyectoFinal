json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :date, :address, :longitude, :latitude, :spot, :ong_id
  json.url event_url(event, format: :json)
end
