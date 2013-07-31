require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :rstid => "MyString",
      :rstname => "MyString",
      :source => "MyString",
      :sdate => "MyString",
      :trialdays => 1,
      :plantype => "MyString",
      :monthlyrate => 1,
      :ipadsold => false,
      :standsold => false,
      :ipadrate => 1,
      :standrate => 1,
      :rstowner => "MyString",
      :rstaddress => "MyString",
      :rstcity => "MyString",
      :rststate => "MyString",
      :rstzip => "MyString",
      :rstcontact => 1,
      :rstmgrcontact => 1,
      :rstemail => "MyString",
      :paymode => "MyString",
      :salestax => 1
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_rstid[name=?]", "customer[rstid]"
      assert_select "input#customer_rstname[name=?]", "customer[rstname]"
      assert_select "input#customer_source[name=?]", "customer[source]"
      assert_select "input#customer_sdate[name=?]", "customer[sdate]"
      assert_select "input#customer_trialdays[name=?]", "customer[trialdays]"
      assert_select "input#customer_plantype[name=?]", "customer[plantype]"
      assert_select "input#customer_monthlyrate[name=?]", "customer[monthlyrate]"
      assert_select "input#customer_ipadsold[name=?]", "customer[ipadsold]"
      assert_select "input#customer_standsold[name=?]", "customer[standsold]"
      assert_select "input#customer_ipadrate[name=?]", "customer[ipadrate]"
      assert_select "input#customer_standrate[name=?]", "customer[standrate]"
      assert_select "input#customer_rstowner[name=?]", "customer[rstowner]"
      assert_select "input#customer_rstaddress[name=?]", "customer[rstaddress]"
      assert_select "input#customer_rstcity[name=?]", "customer[rstcity]"
      assert_select "input#customer_rststate[name=?]", "customer[rststate]"
      assert_select "input#customer_rstzip[name=?]", "customer[rstzip]"
      assert_select "input#customer_rstcontact[name=?]", "customer[rstcontact]"
      assert_select "input#customer_rstmgrcontact[name=?]", "customer[rstmgrcontact]"
      assert_select "input#customer_rstemail[name=?]", "customer[rstemail]"
      assert_select "input#customer_paymode[name=?]", "customer[paymode]"
      assert_select "input#customer_salestax[name=?]", "customer[salestax]"
    end
  end
end
