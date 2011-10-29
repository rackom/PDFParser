require 'spec_helper'

describe "state_options/index.html.erb" do
  before(:each) do
    assign(:state_options, [
      stub_model(StateOption,
        :value => "Value",
        :element => nil
      ),
      stub_model(StateOption,
        :value => "Value",
        :element => nil
      )
    ])
  end

  it "renders a list of state_options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
