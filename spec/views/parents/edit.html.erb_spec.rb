require 'spec_helper'

describe "parents/edit" do
  before(:each) do
    @parent = assign(:parent, stub_model(Parent,
      :parentname => "MyString"
    ))
  end

  it "renders the edit parent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parent_path(@parent), "post" do
      assert_select "input#parent_parentname[name=?]", "parent[parentname]"
    end
  end
end
