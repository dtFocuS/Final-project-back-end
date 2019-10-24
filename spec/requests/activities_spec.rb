require 'rails_helper'
require 'json'

RSpec.describe "Activities", type: :request do

  
  describe "GET activities#index" do
    it "should get index" do
      get '/api/v1/activities'
      expect(response).to have_http_status(200)
      # expect(json['status']).to equl('ok')
    end
  end

  describe "POST activities#create" do
    let (:user) { User.create(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }

    it "should be able to create with valid attributes" do
      activity_params = { activity: {
        name: 'Basketball',
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      headers = { "Content-Type": "application/json" }
      post '/api/v1/activities', :params => activity_params.to_json, :headers => headers
      expect(response).to have_http_status(201)
    end

    it 'should not be able to create with without name' do
      activity_params = { activity: {
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      headers = { "Content-Type": "application/json" }
      post '/api/v1/activities', :params => activity_params.to_json, :headers => headers
      expect(response).to have_http_status(406)
    end


  end
end
