require 'rails_helper'

RSpec.describe Performance, type: :model do
  before(:example) do
    @user = User.create(name: 'Axel', id: 1, email: 'axel@gmail2.com', password: '123456')
    @group = Group.create(name: 'group1', icon: 'https//something.com', user_id: @user.id)
    @performance = Performance.create(user_id: @user.id, name: 'performance1', amount: 45.13)
    @group.performance << @performance
  end

  after(:example) do
    @performance.destroy
    @group.destroy
    @user.destroy
  end

  context 'performance model' do
    it 'info' do
      expect(@performance.name).to eq('performance1')
      expect(@performance.amount).to eq(45.13)
      expect(@performance.user_id).to eq(1)
      expect(@group.performance).not_to be_nil
    end
  end
end
