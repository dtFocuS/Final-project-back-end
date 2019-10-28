require 'rails_helper'
require 'faker'

RSpec.describe "Users", type: :request do

  headers = { "Content-Type": "application/json" }

  describe "GET users#index" do
    it "should get index" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST users#create" do
    it 'create user with valid attributes' do
      user_params = { user: {
        first_name: 'Danny',
        last_name: 'Tseng',
        username: Faker::Name.name,
        password: '123',
        email: 'dannychamp@example.com'
      }}
      post '/api/v1/users', :params => user_params.to_json, :headers => headers
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end

    it 'should not be able to create users with the same username' do
      username = Faker::Name.name

      user_params = { user: {
        first_name: 'Danny',
        last_name: 'Tseng',
        username: username,
        password: '123',
        email: 'dannychamp@example.com'
      }}

      new_user_params = { user: {
        first_name: 'Tony',
        last_name: 'Stark',
        username: username,
        password: '123',
        email: 'dchamp@example.com'
      }}

      user = User.create(user_params[:user])
      post '/api/v1/users', :params => new_user_params.to_json, :headers => headers
      expect(response).to have_http_status(406)
    end

  end
end
