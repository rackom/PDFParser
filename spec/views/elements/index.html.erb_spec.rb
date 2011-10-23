require 'spec_helper'

describe "elements/index.html.erb" do
  before(:each) do
    assign(:elements, [
      stub_model(Element,
        :FieldType => "Field Type",
        :FieldName => "MyText",
        :FieldNameAlt => "MyText",
        :FieldFlags => 1,
        :FieldJustification => "Field Justification",
        :FieldMaxLength => 1
      ),
      stub_model(Element,
        :FieldType => "Field Type",
        :FieldName => "MyText",
        :FieldNameAlt => "MyText",
        :FieldFlags => 1,
        :FieldJustification => "Field Justification",
        :FieldMaxLength => 1
      )
    ])
  end

  it "renders a list of elements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field Justification".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
