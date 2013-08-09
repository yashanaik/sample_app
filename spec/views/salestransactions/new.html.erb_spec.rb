require 'spec_helper'

describe "salestransactions/new" do
  before(:each) do
    assign(:salestransaction, stub_model(Salestransaction,
      :sdate => "MyString",
      :table37id => "MyString",
      :salesid => "MyString",
      :salesamount => 1,
      :salescommission => 1
    ).as_new_record)
  end

  it "renders new salestransaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", salestransactions_path, "post" do
      assert_select "input#salestransaction_sdate[name=?]", "salestransaction[sdate]"
      assert_select "input#salestransaction_table37id[name=?]", "salestransaction[table37id]"
      assert_select "input#salestransaction_salesid[name=?]", "salestransaction[salesid]"
      assert_select "input#salestransaction_salesamount[name=?]", "salestransaction[salesamount]"
      assert_select "input#salestransaction_salescommission[name=?]", "salestransaction[salescommission]"
    end
  end
end
