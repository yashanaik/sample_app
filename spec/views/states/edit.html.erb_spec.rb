require 'spec_helper'

describe "states/edit" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :statename => "MyString",
      :countryname => "MyString"
    ))
  end

  it "renders the edit state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", state_path(@state), "post" do
      assert_select "input#state_statename[name=?]", "state[statename]"
      assert_select "input#state_countryname[name=?]", "state[countryname]"
    end
  end
end
