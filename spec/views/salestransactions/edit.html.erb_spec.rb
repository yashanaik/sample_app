require 'spec_helper'

describe "salestransactions/edit" do
  before(:each) do
    @salestransaction = assign(:salestransaction, stub_model(Salestransaction,
      :sdate => "MyString",
      :table37id => "MyString",
      :salesid => "MyString",
      :salesamount => 1,
      :salescommission => 1
    ))
  end

  it "renders the edit salestransaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", salestransaction_path(@salestransaction), "post" do
      assert_select "input#salestransaction_sdate[name=?]", "salestransaction[sdate]"
      assert_select "input#salestransaction_table37id[name=?]", "salestransaction[table37id]"
      assert_select "input#salestransaction_salesid[name=?]", "salestransaction[salesid]"
      assert_select "input#salestransaction_salesamount[name=?]", "salestransaction[salesamount]"
      assert_select "input#salestransaction_salescommission[name=?]", "salestransaction[salescommission]"
    end
  end
end
