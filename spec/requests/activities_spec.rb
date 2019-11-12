require 'rails_helper'
require 'json'

RSpec.describe "Activities", type: :request do

  let (:user) { User.create(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }
  headers = { "Content-Type": "application/json" }
  
  describe "GET activities#index" do
    it "should get index" do
      get '/api/v1/activities'
      expect(response).to have_http_status(200)
      # expect(json['status']).to equl('ok')
    end
  end

  describe "POST activities#create" do
    
    it "should be able to create with valid attributes" do
      activity_params = { activity: {
        name: 'Basketball',
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      post '/api/v1/activities', :params => activity_params.to_json, :headers => headers
      expect(response).to have_http_status(201)
    end

    it 'should not be able to create without name' do
      activity_params = { activity: {
        name: '',
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      post '/api/v1/activities', :params => activity_params.to_json, :headers => headers
      expect(response).to have_http_status(406)
    end
  end

  describe 'PATCH activities#update' do
    it 'should update the description' do
      activity_params = { activity: {
        name: 'Basketball',
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      
      new_activity_params = { activity: {
        name: 'Basketball',
        description: 'Change from 3v3 to 5v5',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      activity = Activity.create(activity_params[:activity])
      put "/api/v1/activities/#{activity.id}", :params => new_activity_params.to_json, :headers => headers
      json = JSON.parse(response.body)
      expect(json["activity"]).to include("description" => "Change from 3v3 to 5v5")
    end
  end

  describe 'DELETE activities#destroy' do
    it 'should delete the activity' do
      activity_params = { activity: {
        name: 'Basketball',
        description: 'Basketball 3v3',
        user_id: user.id,
        latitude: 47.7170,
        longitude: -122.3015,
        address: 'b coffee'
      }}
      activity = Activity.create(activity_params[:activity])
      delete "/api/v1/activities/#{activity.id}"
      expect(response).to have_http_status(200)
    end
  end
end
