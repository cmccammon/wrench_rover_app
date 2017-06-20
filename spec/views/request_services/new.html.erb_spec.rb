require 'rails_helper'

RSpec.describe "request_services/new", type: :view do
  before(:each) do
    assign(:request_service, RequestService.new(
      :service => "MyString",
      :request => nil
    ))
  end

  it "renders new request_service form" do
    render

    assert_select "form[action=?][method=?]", request_services_path, "post" do

      assert_select "input#request_service_service[name=?]", "request_service[service]"

      assert_select "input#request_service_request_id[name=?]", "request_service[request_id]"
    end
  end
end
