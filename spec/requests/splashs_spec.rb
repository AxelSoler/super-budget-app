require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  context 'When testing GET #index' do
    before(:example) { get root_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('SUPER BUDGET APP')
    end
  end
end
