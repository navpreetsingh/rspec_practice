require 'spec_helper'

describe "examples/index" do
  before(:each) do
    assign(:examples, [
      stub_model(Example,
        :title => "Title"
      ),
      stub_model(Example,
        :title => "Title"
      )
    ])
  end

  it "renders a list of examples" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
