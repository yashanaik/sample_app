require 'spec_helper'

describe "states/index" do
  before(:each) do
    assign(:states, [
      stub_model(State,
        :statename => "Statename",
        :countryname => "Countryname"
      ),
      stub_model(State,
        :statename => "Statename",
        :countryname => "Countryname"
      )
    ])
  end

  it "renders a list of states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Statename".to_s, :count => 2
    assert_select "tr>td", :text => "Countryname".to_s, :count => 2
  end
end
