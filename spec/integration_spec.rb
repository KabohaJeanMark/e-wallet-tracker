require 'rails_helper'

feature 'Integration test walkthrough' do
  background do
    user = User.new(name: 'jean', password: '123456', email: 'jean@example.com')
    visit new_user_registration_path
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
  end

  scenario 'visits all groups page' do
    visit groups_path
    expect(page).to have_content('ALL GROUPS')
  end

  scenario 'fails to create a group with no icon' do
    visit new_group_path
    fill_in 'group_name', with: 'Investment club'
    click_button 'Create Group'
    expect(page).to have_content("Icon can't be blank")
  end

  scenario 'creates a new transaction' do
    visit new_entity_path
    fill_in 'entity_name', with: 'Dumb bells'
    click_button 'Create Transaction'
    visit my_transactions_path
    expect(page).to have_content("Amount can't be blank")
  end

  scenario 'visits user profile' do
    visit current_path
    expect(page).to have_content('Sign out')
  end
end
