require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Performance new page', type: :feature do
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
    visit new_group_performance_path(@group3.id)
  end

  context 'When on performance new page' do
    it 'title and sign out link' do
      expect(page).to have_content('NEW ITEM')
      expect(page).to have_selector(:link_or_button, 'Sign out')
    end

    it 'form content' do
      expect(page).to have_content('group1')
      expect(page).to have_content('group2')
      expect(page).to have_content('group3')
      expect(page).to have_content('group4')
      expect(page).to have_selector(:link_or_button, 'SAVE')
    end
  end
end
# rubocop:enable Metrics/BlockLength
