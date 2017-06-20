require 'rails_helper'

RSpec.describe "request_services/show", type: :view do
  before(:each) do
    @request_service = assign(:request_service, RequestService.create!(
      :service => "Service",
      :request => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Service/)
    expect(rendered).to match(//)
  end
end
