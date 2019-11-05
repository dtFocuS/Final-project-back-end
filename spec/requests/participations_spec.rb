require 'rails_helper'
require 'faker'

RSpec.describe "Participations", type: :request do

  headers = { "Content-Type": "application/json" }
  let (:user) { User.create(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }

  describe "GET participations#index" do
    it "should get index" do
      get '/api/v1/participations'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST participations#create" do
    it "should be able to create with valid user and activity" do
      activity = Activity.create(name: 'Basketball', description: 'Basketball 3v3', user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: 'b coffee')

      participation_params = { participation: {
        user_id: user.id,
        activity_id: activity.id
      }}

      post '/api/v1/participations', :params => participation_params.to_json, :headers => headers
      expect(response).to have_http_status(201)
    end

  end
end
