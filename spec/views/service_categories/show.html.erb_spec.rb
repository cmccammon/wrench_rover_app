require 'rails_helper'

RSpec.describe "service_categories/show", type: :view do
  before(:each) do
    @service_category = assign(:service_category, ServiceCategory.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
