require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
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
      ),
      stub_model(Customer,
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
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rstid".to_s, :count => 2
    assert_select "tr>td", :text => "Rstname".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Sdate".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Plantype".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Rstowner".to_s, :count => 2
    assert_select "tr>td", :text => "Rstaddress".to_s, :count => 2
    assert_select "tr>td", :text => "Rstcity".to_s, :count => 2
    assert_select "tr>td", :text => "Rststate".to_s, :count => 2
    assert_select "tr>td", :text => "Rstzip".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Rstemail".to_s, :count => 2
    assert_select "tr>td", :text => "Paymode".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
