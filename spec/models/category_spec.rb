require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    category = build(:category)
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = build(:category, name: nil)
    category.validate
    expect(category.errors[:name].size).to eq 1
  end

  it 'is valid with 20 length name' do
    category = build(:category, name: 'カテゴリーカテゴリーカテゴリーカテゴリー')
    category.validate
    expect(category).to be_valid
  end

  it 'is invalid with over 20 length name' do
    category = build(:category, name: 'カテゴリーカテゴリーカテゴリーカテゴリーa')
    category.validate
    expect(category.errors[:name].size).to eq 1
  end
end
