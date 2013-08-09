require 'spec_helper'

describe "cities/index" do
  before(:each) do
    assign(:cities, [
      stub_model(City,
        :cityname => "Cityname",
        :statename => "Statename"
      ),
      stub_model(City,
        :cityname => "Cityname",
        :statename => "Statename"
      )
    ])
  end

  it "renders a list of cities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cityname".to_s, :count => 2
    assert_select "tr>td", :text => "Statename".to_s, :count => 2
  end
end
