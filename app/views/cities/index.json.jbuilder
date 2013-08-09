json.array!(@cities) do |city|
  json.extract! city, :cityname, :statename
  json.url city_url(city, format: :json)
end