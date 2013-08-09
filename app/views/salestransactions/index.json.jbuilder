json.array!(@salestransactions) do |salestransaction|
  json.extract! salestransaction, :sdate, :table37id, :salesid, :salesamount, :salescommission
  json.url salestransaction_url(salestransaction, format: :json)
end