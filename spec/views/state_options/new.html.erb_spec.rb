require 'spec_helper'

describe "state_options/new.html.erb" do
  before(:each) do
    assign(:state_option, stub_model(StateOption,
      :value => "MyString",
      :element => nil
    ).as_new_record)
  end

  it "renders new state_option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => state_options_path, :method => "post" do
      assert_select "input#state_option_value", :name => "state_option[value]"
      assert_select "input#state_option_element", :name => "state_option[element]"
    end
  end
end
