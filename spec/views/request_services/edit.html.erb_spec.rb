require 'rails_helper'

RSpec.describe "request_services/edit", type: :view do
  before(:each) do
    @request_service = assign(:request_service, RequestService.create!(
      :service => "MyString",
      :request => nil
    ))
  end

  it "renders the edit request_service form" do
    render

    assert_select "form[action=?][method=?]", request_service_path(@request_service), "post" do

      assert_select "input#request_service_service[name=?]", "request_service[service]"

      assert_select "input#request_service_request_id[name=?]", "request_service[request_id]"
    end
  end
end
