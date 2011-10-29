require "spec_helper"

describe StateOptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/state_options").should route_to("state_options#index")
    end

    it "routes to #new" do
      get("/state_options/new").should route_to("state_options#new")
    end

    it "routes to #show" do
      get("/state_options/1").should route_to("state_options#show", :id => "1")
    end

    it "routes to #edit" do
      get("/state_options/1/edit").should route_to("state_options#edit", :id => "1")
    end

    it "routes to #create" do
      post("/state_options").should route_to("state_options#create")
    end

    it "routes to #update" do
      put("/state_options/1").should route_to("state_options#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/state_options/1").should route_to("state_options#destroy", :id => "1")
    end

  end
end
