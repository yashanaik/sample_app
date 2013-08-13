json.array!(@parents) do |parent|
  json.extract! parent, :parentname
  json.url parent_url(parent, format: :json)
end