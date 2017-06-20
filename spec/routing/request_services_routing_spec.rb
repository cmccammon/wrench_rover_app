require "rails_helper"

RSpec.describe RequestServicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/request_services").to route_to("request_services#index")
    end

    it "routes to #new" do
      expect(:get => "/request_services/new").to route_to("request_services#new")
    end

    it "routes to #show" do
      expect(:get => "/request_services/1").to route_to("request_services#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/request_services/1/edit").to route_to("request_services#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/request_services").to route_to("request_services#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/request_services/1").to route_to("request_services#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/request_services/1").to route_to("request_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/request_services/1").to route_to("request_services#destroy", :id => "1")
    end

  end
end
