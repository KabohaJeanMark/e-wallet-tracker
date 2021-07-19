require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      user1 = User.new(name: 'jean', password: '123456', email: 'jean@example.com').save
      expect(user1).to eq(true)
    end
    it 'requires a password of atleast 6 digits' do
      user2 = User.new(name: 'dexter', password: '123', email: 'dex@example.com').save
      expect(user2).to eq(false)
    end
    it 'requires a valid email' do
      user3 = User.create(name: 'morpheus', password: '12fgt1234', email: 'morph')
      expect(user3.errors.full_messages).to include('Email is invalid')
    end
    it 'cannot accept a blank password' do
      user4 = User.create(name: 'morpheus', password: '', email: 'morph@email.com')
      expect(user4.errors.full_messages).to include("Password can't be blank")
    end
    it 'should have an email' do
      user5 = User.create(name: 'morpheus', password: '12fgt1234', email: '')
      expect(user5.errors.full_messages).to include("Email can't be blank")
    end
    it 'should have a unique email' do
      User.create(name: 'jean', password: '123456', email: 'jean@example.com')
      user6 = User.create(name: 'marco', password: 'mar456', email: 'jean@example.com')
      expect(user6.errors.full_messages).to include('Email has already been taken')
    end
  end

  context 'association test' do
    it 'can have many groups' do
      u = User.reflect_on_association(:groups)
      expect(u.macro).to eq(:has_many)
    end
    it 'can author many entities' do
      u = User.reflect_on_association(:entities)
      expect(u.macro).to eq(:has_many)
    end
  end
end
