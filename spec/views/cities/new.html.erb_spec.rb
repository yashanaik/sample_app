require 'spec_helper'

describe "cities/new" do
  before(:each) do
    assign(:city, stub_model(City,
      :cityname => "MyString",
      :statename => "MyString"
    ).as_new_record)
  end

  it "renders new city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cities_path, "post" do
      assert_select "input#city_cityname[name=?]", "city[cityname]"
      assert_select "input#city_statename[name=?]", "city[statename]"
    end
  end
end
