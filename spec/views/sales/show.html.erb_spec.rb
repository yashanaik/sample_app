require 'spec_helper'

describe "sales/show" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :salesid => "Salesid",
      :spname => "Spname",
      :spcompany => "Spcompany",
      :spcomm => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Salesid/)
    rendered.should match(/Spname/)
    rendered.should match(/Spcompany/)
    rendered.should match(/1/)
  end
end
