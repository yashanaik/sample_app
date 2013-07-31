json.array!(@customers) do |customer|
  json.extract! customer, :rstid, :rstname, :source, :sdate, :trialdays, :plantype, :monthlyrate, :ipadsold, :standsold, :ipadrate, :standrate, :rstowner, :rstaddress, :rstcity, :rststate, :rstzip, :rstcontact, :rstmgrcontact, :rstemail, :paymode, :salestax
  json.url customer_url(customer, format: :json)
end