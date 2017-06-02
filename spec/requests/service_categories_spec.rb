require 'rails_helper'

RSpec.describe "ServiceCategories", type: :request do
  describe "GET /service_categories" do
    it "works! (now write some real specs)" do
      get service_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
