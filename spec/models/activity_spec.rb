require 'rails_helper'

RSpec.describe Activity, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      activity = Activity.new(description: 'activity description', password: '123', email: 'sample@example.com').save
      expect(activity).to eq(false)
    end
  end
end
