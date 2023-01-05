require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
    @category = Category.new(name: 'Food', icon: 'food.png', user_id: @user.id)
  end

  it 'name should be valid with correct parameters' do
    expect(@category).to be_valid
  end

  it 'name should be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'icon should be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end
