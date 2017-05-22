require 'rails_helper'

RSpec.describe "Autos", type: :request do
  describe "GET /autos" do
    it "works! (now write some real specs)" do
      get autos_path
      expect(response).to have_http_status(200)
    end
  end
end
