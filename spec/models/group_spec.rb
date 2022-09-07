require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.new(name: 'Axel', id: 1, email: 'axel@gmail2.com', password: '123456')
  group = Group.new(name: 'group1', icon: 'https//something.com', user_id: user.id)
  before { group.save }

  it 'all info from group' do
    expect(group.user_id).not_to be_nil
    expect(group.name).to eq('group1')
    expect(group.icon).to eq('https//something.com')
  end
end
