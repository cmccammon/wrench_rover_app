require 'rails_helper'

RSpec.describe "service_categories/index", type: :view do
  before(:each) do
    assign(:service_categories, [
      ServiceCategory.create!(
        :name => "Name"
      ),
      ServiceCategory.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of service_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
