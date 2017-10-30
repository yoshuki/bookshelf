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

  describe '#books' do
    let(:category_1) { create(:category) }
    let(:category_2) { create(:category) }
    let(:category_3) { create(:category) }
    let(:book_1) { create(:book) }
    let(:book_2) { create(:book) }
    let(:book_3) { create(:book) }

    it 'returns categorized books' do
      book_1.categories = [category_1, category_2]
      book_2.categories = [category_2, category_3]
      book_3.categories = [category_1, category_3]

      aggregate_failures do
        expect(category_1.books).to contain_exactly(book_1, book_3)
        expect(category_2.books).to contain_exactly(book_1, book_2)
        expect(category_3.books).to contain_exactly(book_2, book_3)
      end
    end
  end
end
