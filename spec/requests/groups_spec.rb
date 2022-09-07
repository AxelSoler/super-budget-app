require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before(:each) do
    @user = User.create(name: 'Axel', id: 1, email: 'axel@gmail2.com', password: '123456')
    sign_in(@user)
    @group = Group.create(name: 'group1', icon: 'https//something.com', user_id: @user.id)
    @performance = Performance.create(user_id: @user.id, name: 'performance1', amount: 45.13)
    @group.performance << @performance
  end

  context 'GET groups page #index' do
    before do
      get groups_path
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', 'Your budget'
    end
  end

  context 'GET groups page #new' do
    before do
      get new_group_path
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders new template' do
      expect(response).to render_template('new')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', 'New group'
    end
  end
end
