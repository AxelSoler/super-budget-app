require 'rails_helper'

RSpec.describe 'Splash index page', type: :feature do
  it 'name and sign in buttons' do
    visit root_path
    expect(page).to have_content('SUPER BUDGET APP')
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end
end
