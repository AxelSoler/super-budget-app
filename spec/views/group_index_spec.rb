require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before do
    @user = User.create!(name: 'Axel', email: 'axel@gmail2.com', password: '123456')
    @group1 = Group.create!(name: 'group1', icon: 'https://something.com', user_id: @user.id)
    @group2 = Group.create!(name: 'group2', icon: 'https://something2.com', user_id: @user.id)
    @group3 = Group.create!(name: 'group3', icon: 'https://something3.com', user_id: @user.id)
    @group4 = Group.create!(name: 'group4', icon: 'https://something4.com', user_id: @user.id)
    @performance1 = Performance.create!(user_id: @user.id, name: 'performance1', amount: 45.13)
    @performance2 = Performance.create!(user_id: @user.id, name: 'performance2', amount: 4)
    @performance3 = Performance.create!(user_id: @user.id, name: 'performance3', amount: 78)
    @performance4 = Performance.create!(user_id: @user.id, name: 'performance4', amount: 0.25)
    @performance5 = Performance.create!(user_id: @user.id, name: 'performance5', amount: 13)
    @performance6 = Performance.create!(user_id: @user.id, name: 'performance6', amount: 15_489.59)
    @group1.performance << @performance1
    @group1.performance << @performance2
    @group1.performance << @performance4
    @group2.performance << @performance3
    @group3.performance << @performance5
    @group3.performance << @performance6
    sign_in(@user)
    visit groups_path
  end

  it 'all the content is rendering in the index page' do
    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_selector(:link_or_button, 'Sign out')
  end

  it 'shoud have 4 groups' do
    expect(page).to have_content(@group1.name)
    expect(page).to have_content(@group2.name)
    expect(page).to have_content(@group3.name)
    expect(page).to have_content(@group4.name)
  end

  it 'shoud have 4 amounts' do
    expect(page).to have_content('$49.38')
    expect(page).to have_content('$78')
    expect(page).to have_content('$15502.59')
    expect(page).to have_content('$0')
  end

  it 'link new group' do
    expect(page).to have_selector(:link_or_button, 'NEW TRANSACTION GROUP')
  end
end
