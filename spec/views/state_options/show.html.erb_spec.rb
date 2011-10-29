require 'spec_helper'

describe "state_options/show.html.erb" do
  before(:each) do
    @state_option = assign(:state_option, stub_model(StateOption,
      :value => "Value",
      :element => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
