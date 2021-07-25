require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user1) { User.create(name: 'jean', email: 'jean@gmail.com', password: '123456') }

  context 'validation test' do
    it 'is not valid without valid params' do
      group1 = Group.new
      expect(group1.valid?).to be false
    end

    it 'is not valid without image' do
      group2 = Group.new(name: 'Exercise', user_id: user1.id)
      expect(group2.valid?).to be false
    end

    it 'requires the presence of the name attribute' do
      group3 = Group.create(name: '', user_id: user1.id)
      expect(group3.errors.full_messages).to include("Name can't be blank")
    end

    it 'needs a name to have atleast 2 characters' do
      group4 = Group.create(name: 'A', user_id: user1.id)
      expect(group4.errors.full_messages).to include('Name is too short (minimum is 2 characters)')
    end

    it 'requires a valid length for the name of the group on creation' do
      group5 = Group.create(name: 'A collection of books by the author of Sherlock Holmes', user_id: user1.id)
      expect(group5.errors.full_messages).to include('Name is too long (maximum is 20 characters)')
    end
  end

  context 'association test' do
    it 'can have many entities' do
      g = Group.reflect_on_association(:entities)
      expect(g.macro).to eq(:has_many)
    end
  end
end
