json.array!(@states) do |state|
  json.extract! state, :statename, :countryname
  json.url state_url(state, format: :json)
end