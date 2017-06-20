require 'rails_helper'

RSpec.describe "request_services/index", type: :view do
  before(:each) do
    assign(:request_services, [
      RequestService.create!(
        :service => "Service",
        :request => nil
      ),
      RequestService.create!(
        :service => "Service",
        :request => nil
      )
    ])
  end

  it "renders a list of request_services" do
    render
    assert_select "tr>td", :text => "Service".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
