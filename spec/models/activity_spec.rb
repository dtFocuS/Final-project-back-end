require 'rails_helper'

RSpec.describe Activity, type: :model do

  let (:user) { User.create(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }
  let (:activity) { Activity.create(name: 'test1', description: "description1", user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee") }
  let (:other_user) { User.create(first_name: 'John', last_name: 'Doe', username: 'johnDoe', password: '123', email: 'sample@example.com')}

  context 'validation test' do
    it 'ensures name presence' do
      activity = Activity.new(description: 'activity description', user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee").save
      expect(activity).to eq(false)
    end

    it 'ensures description presence' do
      activity = Activity.new(name: "activity 1", user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee").save
      expect(activity).to eq(false)
    end

    it 'should be a valid activity' do
      activity = Activity.new(name: 'test1', description: "description1", user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee").save
      expect(activity).to eq(true)
    end

  end

  describe Activity, '.others_activity_ids' do
    # let (:user) { User.new(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }
    # let (:activity) { Activity.create(name: 'test1', description: "description1", user_id: user.id, latitude: 47.7170, longitude: -122.3015, address: "b coffee") }

    # let (:otherUser) { User.create(first_name: 'John', last_name: 'Doe', username: 'johnDoe', password: '123', email: 'sample@example.com')}

    context 'retrieving the ids of the activities that are not created by the user' do
      it 'should be 0' do
        activity
        expect(Activity.others_activity_ids(user.id).length).to eq(0)
      end

      it 'should be the same id' do
        activity
        expect(Activity.others_activity_ids(other_user.id)[0]).to eq(activity.id)

      end
      
    end

  end

  describe Activity, '.other_not_joined_activities' do
    context 'retrieving the activities that are not joined by the user' do

      it 'there should be no activities created by other users that are not joined by the current user' do
        activity
        expect(Activity.other_not_joined_activities(user.id).length).to eq(0)
      end

      it 'should be 1' do
        activity
        expect(Activity.other_not_joined_activities(other_user.id).length).to eq(1)
      end


    end
  end

  
  
end
