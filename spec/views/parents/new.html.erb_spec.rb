require 'spec_helper'

describe "parents/new" do
  before(:each) do
    assign(:parent, stub_model(Parent,
      :parentname => "MyString"
    ).as_new_record)
  end

  it "renders new parent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parents_path, "post" do
      assert_select "input#parent_parentname[name=?]", "parent[parentname]"
    end
  end
end
