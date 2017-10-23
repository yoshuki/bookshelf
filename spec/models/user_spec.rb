require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a email' do
    user = build(:user, email: nil)
    user.validate
    expect(user.errors[:email].size).to eq 1
  end

  it 'is invalid without a last_name' do
    user = build(:user, last_name: nil)
    user.validate
    expect(user.errors[:last_name].size).to eq 1
  end

  it 'is valid with 20 length last_name' do
    user = build(:user, last_name: '山田山田山田山田山田山田山田山田山田山田')
    user.validate
    expect(user).to be_valid
  end

  it 'is invalid with over 20 length last_name' do
    user = build(:user, last_name: '山田山田山田山田山田山田山田山田山田山田a')
    user.validate
    expect(user.errors[:last_name].size).to eq 1
  end

  it 'is valid without a first_name' do
    user = build(:user, first_name: nil)
    user.validate
    expect(user).to be_valid
  end

  it 'is valid with 20 length first_name' do
    user = build(:user, first_name: '太郎太郎太郎太郎太郎太郎太郎太郎太郎太郎')
    user.validate
    expect(user).to be_valid
  end

  it 'is invalid with over 20 length first_name' do
    user = build(:user, first_name: '太郎太郎太郎太郎太郎太郎太郎太郎太郎太郎a')
    user.validate
    expect(user.errors[:first_name].size).to eq 1
  end

  describe '#name' do
    context 'when first_name and last_name are both set' do
      it 'returns full name' do
        user = build(:user, first_name: '太郎', last_name: '山田')
        expect(user.name).to eq '山田 太郎'
      end
    end

    context 'when only last_name is set' do
      it 'returns only last_name' do
        user = build(:user, first_name: nil, last_name: '山田')
        expect(user.name).to eq '山田'
      end
    end
  end
end
