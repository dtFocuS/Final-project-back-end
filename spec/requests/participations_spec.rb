require 'rails_helper'
require 'faker'

RSpec.describe "Participations", type: :request do

  headers = { "Content-Type": "application/json" }


  describe "GET participations#index" do
    it "should get index" do

      get '/api/v1/participations'
      expect(response).to have_http_status(200)
    end
  end
end
