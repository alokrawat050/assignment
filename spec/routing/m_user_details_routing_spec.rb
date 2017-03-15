require "rails_helper"

RSpec.describe MUserDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/m_user_details").to route_to("m_user_details#index")
    end

    it "routes to #new" do
      expect(:get => "/m_user_details/new").to route_to("m_user_details#new")
    end

    it "routes to #show" do
      expect(:get => "/m_user_details/1").to route_to("m_user_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/m_user_details/1/edit").to route_to("m_user_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/m_user_details").to route_to("m_user_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/m_user_details/1").to route_to("m_user_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/m_user_details/1").to route_to("m_user_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/m_user_details/1").to route_to("m_user_details#destroy", :id => "1")
    end

  end
end
