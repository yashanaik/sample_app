require 'spec_helper'

describe "cities/edit" do
  before(:each) do
    @city = assign(:city, stub_model(City,
      :cityname => "MyString",
      :statename => "MyString"
    ))
  end

  it "renders the edit city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", city_path(@city), "post" do
      assert_select "input#city_cityname[name=?]", "city[cityname]"
      assert_select "input#city_statename[name=?]", "city[statename]"
    end
  end
end
