require 'rails_helper'

RSpec.describe "Users", type: :request do

  user_params = { user: {
    first_name: 'Danny',
    last_name: 'Tseng',
    username: 'DannyChamp',
    password: '123',
    email: 'dannychamp@example.com'
  }}

  new_user_params = { user: {
    first_name: 'Tony',
    last_name: 'Stark',
    username: 'DannyChamp',
    password: '123',
    email: 'dchamp@example.com'
  }}

  headers = { "Content-Type": "application/json" }

  describe "GET users#index" do
    it "should get index" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST users#create" do
    it 'create user with valid attributes' do
      post '/api/v1/users', :params => user_params.to_json, :headers => headers
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
      expect(json["user"]).to include("username" => "DannyChamp")
    end

    it 'should not be able to create users with the same username' do
      user = User.create(user_params[:user])
      post '/api/v1/users', :params => new_user_params.to_json, :headers => headers
      expect(response).to have_http_status(406)
    end

  end
end
