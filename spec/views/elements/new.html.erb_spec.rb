require 'spec_helper'

describe "elements/new.html.erb" do
  before(:each) do
    assign(:element, stub_model(Element,
      :FieldType => "MyString",
      :FieldName => "MyText",
      :FieldNameAlt => "MyText",
      :FieldFlags => 1,
      :FieldJustification => "MyString",
      :FieldMaxLength => 1
    ).as_new_record)
  end

  it "renders new element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => elements_path, :method => "post" do
      assert_select "input#element_FieldType", :name => "element[FieldType]"
      assert_select "textarea#element_FieldName", :name => "element[FieldName]"
      assert_select "textarea#element_FieldNameAlt", :name => "element[FieldNameAlt]"
      assert_select "input#element_FieldFlags", :name => "element[FieldFlags]"
      assert_select "input#element_FieldJustification", :name => "element[FieldJustification]"
      assert_select "input#element_FieldMaxLength", :name => "element[FieldMaxLength]"
    end
  end
end
