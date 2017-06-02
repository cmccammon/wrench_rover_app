require "rails_helper"

RSpec.describe ServiceCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_categories").to route_to("service_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/service_categories/new").to route_to("service_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/service_categories/1").to route_to("service_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_categories/1/edit").to route_to("service_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_categories").to route_to("service_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/service_categories/1").to route_to("service_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/service_categories/1").to route_to("service_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_categories/1").to route_to("service_categories#destroy", :id => "1")
    end

  end
end
