require 'rails_helper'

RSpec.describe Activity, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      activity = Activity.new(description: 'activity description').save
      expect(activity).to eq(false)
    end

    it 'ensures description presence' do
      activity = Activity.new(name: "activity 1").save
      expect(activity).to eq(false)
    end

  end

  describe Activity, '.others_activity_ids' do
    let (:user) { User.new(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com') }
    let (:activity) { Activity.new(name: 'test1', description: "description1") }

    context 'retrieving the ids of the activities that are not created by the user' do
      it 'should be 0' do
        expect(Activity.others_activity_ids(user.id).length).to eq(0)
      end
      
    end


  end
  
end
