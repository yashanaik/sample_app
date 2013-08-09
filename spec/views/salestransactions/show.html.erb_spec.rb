require 'spec_helper'

describe "salestransactions/show" do
  before(:each) do
    @salestransaction = assign(:salestransaction, stub_model(Salestransaction,
      :sdate => "Sdate",
      :table37id => "Table37id",
      :salesid => "Salesid",
      :salesamount => 1,
      :salescommission => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sdate/)
    rendered.should match(/Table37id/)
    rendered.should match(/Salesid/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
