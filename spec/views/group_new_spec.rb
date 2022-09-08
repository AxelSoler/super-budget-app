require 'rails_helper'

RSpec.describe 'group new page', type: :feature do
  before do
    @user = User.create!(name: 'Axel', email: 'axel@gmail2.com', password: '123456')
    @group = Group.create!(name: 'group1', icon: 'https://something.com', user_id: @user.id)
    sign_in(@user)
    visit new_group_path
  end

  it 'form labels' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
    expect(page).to have_content('Flaticon')
  end

  it 'remove button should be showed' do
    expect(page).to have_selector(:link_or_button, 'Back to groups')
  end
end
