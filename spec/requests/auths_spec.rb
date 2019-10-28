require 'rails_helper'
require 'faker'

RSpec.describe "Auths", type: :request do

  headers = { "Content-Type": "application/json" }

  describe "POST auth#create" do
    it "should authorize user on login" do
      username = Faker::Name.name 

      user_params = { user: {
        first_name: 'Abc',
        last_name: 'Efg',
        username: username,
        password: '123',
        email: 'dannychamp@example.com'
      }}

      user = User.create(user_params[:user])
      post '/api/v1/login', :params => user_params.to_json, :headers => headers
      expect(response).to have_http_status(202)
    end
  end
end
