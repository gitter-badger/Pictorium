require "rails_helper"

RSpec.describe UserpagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/userpages").to route_to("userpages#index")
    end

    it "routes to #new" do
      expect(:get => "/userpages/new").to route_to("userpages#new")
    end

    it "routes to #show" do
      expect(:get => "/userpages/1").to route_to("userpages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/userpages/1/edit").to route_to("userpages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/userpages").to route_to("userpages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/userpages/1").to route_to("userpages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/userpages/1").to route_to("userpages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/userpages/1").to route_to("userpages#destroy", :id => "1")
    end

  end
end
