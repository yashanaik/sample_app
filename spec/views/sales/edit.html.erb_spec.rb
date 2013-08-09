require 'spec_helper'

describe "sales/edit" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :salesid => "MyString",
      :spname => "MyString",
      :spcompany => "MyString",
      :spcomm => 1
    ))
  end

  it "renders the edit sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do
      assert_select "input#sale_salesid[name=?]", "sale[salesid]"
      assert_select "input#sale_spname[name=?]", "sale[spname]"
      assert_select "input#sale_spcompany[name=?]", "sale[spcompany]"
      assert_select "input#sale_spcomm[name=?]", "sale[spcomm]"
    end
  end
end
