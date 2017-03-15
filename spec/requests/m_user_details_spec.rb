require 'rails_helper'

RSpec.describe "MUserDetails", type: :request do
  describe "GET /m_user_details" do
    it "works! (now write some real specs)" do
      get m_user_details_path
      expect(response).to have_http_status(200)
    end
  end
end
