require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :rstid => "Rstid",
      :rstname => "Rstname",
      :source => "Source",
      :sdate => "Sdate",
      :trialdays => 1,
      :plantype => "Plantype",
      :monthlyrate => 2,
      :ipadsold => false,
      :standsold => false,
      :ipadrate => 3,
      :standrate => 4,
      :rstowner => "Rstowner",
      :rstaddress => "Rstaddress",
      :rstcity => "Rstcity",
      :rststate => "Rststate",
      :rstzip => "Rstzip",
      :rstcontact => 5,
      :rstmgrcontact => 6,
      :rstemail => "Rstemail",
      :paymode => "Paymode",
      :salestax => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rstid/)
    rendered.should match(/Rstname/)
    rendered.should match(/Source/)
    rendered.should match(/Sdate/)
    rendered.should match(/1/)
    rendered.should match(/Plantype/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Rstowner/)
    rendered.should match(/Rstaddress/)
    rendered.should match(/Rstcity/)
    rendered.should match(/Rststate/)
    rendered.should match(/Rstzip/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/Rstemail/)
    rendered.should match(/Paymode/)
    rendered.should match(/7/)
  end
end
