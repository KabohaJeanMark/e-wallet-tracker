require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user1) { User.create(name: 'jean', email: 'jean@gmail.com', password: '123456') }
  let(:group1) { Group.create(name: 'Physical fitness', user_id: user1.id) }

  context 'validation test' do
    it 'is not valid without valid params' do
      entity = Entity.new
      expect(entity.valid?).to be false
    end
    it 'is valid with valid params' do
      entity1 = Entity.new(name: 'Exercise', amount: 50, group_id: group1.id, author_id: user1.id)
      expect(entity1.valid?).to be true
    end
    it 'requires the presence of the amount attribute' do
      entity3 = Entity.create(name: 'Fitness', amount: '', author_id: user1.id, group_id: group1.id)
      expect(entity3.errors.full_messages).to include("Amount can't be blank")
    end
    it 'cannot have the name left blank' do
      entity4 = Entity.create(name: '', amount: 200, author_id: user1.id, group_id: group1.id)
      expect(entity4.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have a name of a length of atleast 2 characters' do
      entity5 = Entity.create(name: 'A', amount: 200, author_id: user1.id, group_id: group1.id)
      expect(entity5.errors.full_messages).to include('Name is too short (minimum is 2 characters)')
    end
    it 'should have amount as a positive integer greater than 0' do
      entity6 = Entity.create(name: 'Apple pie', amount: -6, author_id: user1.id, group_id: group1.id)
      expect(entity6.errors.full_messages).to include('Amount must be greater than 0')
    end
  end
end
