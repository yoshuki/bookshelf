require 'rails_helper'

RSpec.describe Categorization, type: :model do
  it 'has a valid factory' do
    categorization = build(:categorization)
    expect(categorization).to be_valid
  end

  it 'is invalid without a book' do
    categorization = build(:categorization, book: nil)
    categorization.validate
    expect(categorization.errors[:book].size).to eq 1
  end

  it 'is invalid without a category' do
    categorization = build(:categorization, category: nil)
    categorization.validate
    expect(categorization.errors[:category].size).to eq 1
  end
end
