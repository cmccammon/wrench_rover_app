require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :name => "MyString",
      :service_category => nil
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_name[name=?]", "service[name]"

      assert_select "input#service_service_category_id[name=?]", "service[service_category_id]"
    end
  end
end
