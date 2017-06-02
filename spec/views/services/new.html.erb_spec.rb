require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :name => "MyString",
      :service_category => nil
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "input#service_service_category_id[name=?]", "service[service_category_id]"
    end
  end
end
