require "spec_helper"

describe SalestransactionsController do
  describe "routing" do

    it "routes to #index" do
      get("/salestransactions").should route_to("salestransactions#index")
    end

    it "routes to #new" do
      get("/salestransactions/new").should route_to("salestransactions#new")
    end

    it "routes to #show" do
      get("/salestransactions/1").should route_to("salestransactions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/salestransactions/1/edit").should route_to("salestransactions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/salestransactions").should route_to("salestransactions#create")
    end

    it "routes to #update" do
      put("/salestransactions/1").should route_to("salestransactions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/salestransactions/1").should route_to("salestransactions#destroy", :id => "1")
    end

  end
end
