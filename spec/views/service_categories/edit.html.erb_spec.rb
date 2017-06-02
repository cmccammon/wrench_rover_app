require 'rails_helper'

RSpec.describe "service_categories/edit", type: :view do
  before(:each) do
    @service_category = assign(:service_category, ServiceCategory.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit service_category form" do
    render

    assert_select "form[action=?][method=?]", service_category_path(@service_category), "post" do

      assert_select "input#service_category_name[name=?]", "service_category[name]"
    end
  end
end
