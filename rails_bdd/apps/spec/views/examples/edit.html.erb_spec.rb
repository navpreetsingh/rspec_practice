require 'spec_helper'

describe "examples/edit" do
  before(:each) do
    @example = assign(:example, stub_model(Example,
      :title => "MyString"
    ))
  end

  it "renders the edit example form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", example_path(@example), "post" do
      assert_select "input#example_title[name=?]", "example[title]"
    end
  end
end
