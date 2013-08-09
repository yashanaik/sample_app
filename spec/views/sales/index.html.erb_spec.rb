require 'spec_helper'

describe "sales/index" do
  before(:each) do
    assign(:sales, [
      stub_model(Sale,
        :salesid => "Salesid",
        :spname => "Spname",
        :spcompany => "Spcompany",
        :spcomm => 1
      ),
      stub_model(Sale,
        :salesid => "Salesid",
        :spname => "Spname",
        :spcompany => "Spcompany",
        :spcomm => 1
      )
    ])
  end

  it "renders a list of sales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Salesid".to_s, :count => 2
    assert_select "tr>td", :text => "Spname".to_s, :count => 2
    assert_select "tr>td", :text => "Spcompany".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
