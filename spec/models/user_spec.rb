require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Axel', id: 1, email: 'axel@gmail2.com', password: '123456') }
  before { subject.save }

  it 'all info from user' do
    expect(subject.id).not_to be_nil
    expect(subject.name).to eq('Axel')
    expect(subject.email).to eq('axel@gmail2.com')
    expect(subject.password).to eq('123456')
  end
end
