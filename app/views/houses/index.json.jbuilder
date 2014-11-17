json.array!(@houses) do |house|
  json.extract! house, :id, :name, :address, :rent, :link
  json.url house_url(house, format: :json)
end
