require 'spec_helper'

describe "sales/new" do
  before(:each) do
    assign(:sale, stub_model(Sale,
      :salesid => "MyString",
      :spname => "MyString",
      :spcompany => "MyString",
      :spcomm => 1
    ).as_new_record)
  end

  it "renders new sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sales_path, "post" do
      assert_select "input#sale_salesid[name=?]", "sale[salesid]"
      assert_select "input#sale_spname[name=?]", "sale[spname]"
      assert_select "input#sale_spcompany[name=?]", "sale[spcompany]"
      assert_select "input#sale_spcomm[name=?]", "sale[spcomm]"
    end
  end
end
