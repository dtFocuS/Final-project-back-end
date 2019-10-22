require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation test' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'last', username: 'username', password: '123', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new(first_name: 'first', username: 'username', password: '123', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures username presence' do
      user = User.new(first_name: 'first', last_name: 'last', password: '123', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(first_name: 'first', last_name: 'last', username: 'username', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(first_name: 'first', last_name: 'last', username: 'username', password: '123').save
      expect(user).to eq(false)
    end

    it 'should be valid user' do
      user = User.new(first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com').save
      expect(user).to eq(true)
    end

  end

  # context 'retrieving participants of each activity' do
  #   let (:user1) { User.new({first_name: 'first', last_name: 'last', username: 'username', password: '123', email: 'sample@example.com'})}
  #   let (:activity) { Activity.new({ name: 'Activity1', description: 'First Activity', user_id: user1.id})}

  #   it 'should have no participants' do
  #     expect(User.get_participants(activity).length).to eq(0)
  #   end
  # end
end
