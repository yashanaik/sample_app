require 'spec_helper'

describe "states/new" do
  before(:each) do
    assign(:state, stub_model(State,
      :statename => "MyString",
      :countryname => "MyString"
    ).as_new_record)
  end

  it "renders new state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", states_path, "post" do
      assert_select "input#state_statename[name=?]", "state[statename]"
      assert_select "input#state_countryname[name=?]", "state[countryname]"
    end
  end
end
