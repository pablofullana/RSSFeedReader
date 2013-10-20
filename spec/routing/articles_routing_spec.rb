require "spec_helper"

describe ArticlesController do
  describe "routing" do

    it "routes to #index" do
      get("/channels/1/articles").should route_to("articles#index", :channel_id => "1")
    end

    it "routes to #new" do
      get("/channels/1/articles/new").should route_to("articles#new", :channel_id => "1")
    end

    it "routes to #show" do
      get("/channels/1/articles/1").should route_to("articles#show", :channel_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/channels/1/articles/1/edit").should route_to("articles#edit", :channel_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/channels/1/articles").should route_to("articles#create", :channel_id => "1")
    end

    it "routes to #update" do
      put("/channels/1/articles/1").should route_to("articles#update", :channel_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/channels/1/articles/1").should route_to("articles#destroy", :channel_id => "1", :id => "1")
    end

  end
end
