require 'spec_helper'

describe "elements/show.html.erb" do
  before(:each) do
    @element = assign(:element, stub_model(Element,
      :FieldType => "Field Type",
      :FieldName => "MyText",
      :FieldNameAlt => "MyText",
      :FieldFlags => 1,
      :FieldJustification => "Field Justification",
      :FieldMaxLength => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field Justification/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
