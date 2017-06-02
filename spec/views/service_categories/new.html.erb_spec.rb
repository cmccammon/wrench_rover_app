require 'rails_helper'

RSpec.describe "service_categories/new", type: :view do
  before(:each) do
    assign(:service_category, ServiceCategory.new(
      :name => "MyString"
    ))
  end

  it "renders new service_category form" do
    render

    assert_select "form[action=?][method=?]", service_categories_path, "post" do

      assert_select "input#service_category_name[name=?]", "service_category[name]"
    end
  end
end
