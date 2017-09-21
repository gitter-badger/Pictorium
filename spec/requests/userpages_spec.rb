require 'rails_helper'

RSpec.describe "Userpages", type: :request do
  describe "GET /userpages" do
    it "works! (now write some real specs)" do
      get userpages_path
      expect(response).to have_http_status(200)
    end
  end
end
