require 'spec_helper'

describe "salestransactions/index" do
  before(:each) do
    assign(:salestransactions, [
      stub_model(Salestransaction,
        :sdate => "Sdate",
        :table37id => "Table37id",
        :salesid => "Salesid",
        :salesamount => 1,
        :salescommission => 2
      ),
      stub_model(Salestransaction,
        :sdate => "Sdate",
        :table37id => "Table37id",
        :salesid => "Salesid",
        :salesamount => 1,
        :salescommission => 2
      )
    ])
  end

  it "renders a list of salestransactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sdate".to_s, :count => 2
    assert_select "tr>td", :text => "Table37id".to_s, :count => 2
    assert_select "tr>td", :text => "Salesid".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
