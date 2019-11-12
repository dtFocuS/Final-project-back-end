require 'rails_helper'

RSpec.describe Participation, type: :model do
  let (:user) { User.create(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }

  context "validation test" do

    it 'cannot create with invalid user' do
      # other_user = User.create(first_name: 'John', last_name: 'Doe', username: 'JDoe', password: '123', email: 'sample@example.com')
      activity = Activity.create(name: 'test1', description: "description1", user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee")
      participation = Participation.new(user_id: User.last.id + 1, activity_id: activity.id).save
      expect(participation).to eq(false)
    end


  end
end
