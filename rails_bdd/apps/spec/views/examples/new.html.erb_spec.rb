require 'spec_helper'

describe "examples/new" do
  before(:each) do
    assign(:example, stub_model(Example,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new example form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", examples_path, "post" do
      assert_select "input#example_title[name=?]", "example[title]"
    end
  end
end
