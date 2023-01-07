require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
    @transaction = Transaction.new(name: 'Food', amount: 100, user_id: @user.id)
  end

  it 'name should be present' do
    @transaction.name = nil
    expect(@transaction).to_not be_valid
  end

  it 'amount should be present' do
    @transaction.amount = nil
    expect(@transaction).to_not be_valid
  end
end
