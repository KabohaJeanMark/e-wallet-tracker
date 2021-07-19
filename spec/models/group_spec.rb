require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user1) { User.create(name: 'jean', email: 'jean@gmail.com', password: '123456') }

  context 'validation test' do
    it 'is not valid without valid params' do
      group1 = Group.new
      expect(group1.valid?).to be false
    end

    it 'is valid with valid params' do
      group2 = Group.new(name: 'Exercise', user_id: user1.id)
      expect(group2.valid?).to be true
    end

    it 'requires the presence of the name attribute' do
      group3 = Group.create(name: '', user_id: user1.id)
      expect(group3.errors.full_messages).to include("Name can't be blank")
    end

  end

  context 'association test' do
    it 'can have many entities' do
      g = Group.reflect_on_association(:entities)
      expect(g.macro).to eq(:has_many)
    end
  end
end