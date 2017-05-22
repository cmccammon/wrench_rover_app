require "rails_helper"

RSpec.describe AutosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/autos").to route_to("autos#index")
    end

    it "routes to #new" do
      expect(:get => "/autos/new").to route_to("autos#new")
    end

    it "routes to #show" do
      expect(:get => "/autos/1").to route_to("autos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/autos/1/edit").to route_to("autos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/autos").to route_to("autos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/autos/1").to route_to("autos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/autos/1").to route_to("autos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/autos/1").to route_to("autos#destroy", :id => "1")
    end

  end
end
