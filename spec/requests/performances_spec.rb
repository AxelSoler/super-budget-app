require 'rails_helper'

RSpec.describe 'Perfromance', type: :request do
  before(:each) do
    @user = User.create!(name: 'Axel', email: 'axel@gmail2.com', password: '123456')
    @group = Group.create!(id: 1, name: 'group1', icon: 'https://something.com', user_id: @user.id)
    @performance = Performance.create!(id: 1, user_id: @user.id, name: 'performance1', amount: 45.13)
    @group.performance << @performance
    sign_in(@user)
  end

  context 'GET Perfromances page #index' do
    before do
      get group_performances_path(@group.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', "group1's transactions"
    end
  end

  context 'GET Perfromances page #new' do
    before do
      get new_group_performance_path(@group.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders new template' do
      expect(response).to render_template('new')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', 'New Item'
    end
  end
end
