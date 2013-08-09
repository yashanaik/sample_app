json.array!(@sales) do |sale|
  json.extract! sale, :salesid, :spname, :spcompany, :spcomm
  json.url sale_url(sale, format: :json)
end