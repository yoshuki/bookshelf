require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a valid factory' do
    book = build(:book)
    expect(book).to be_valid
  end

  it 'is invalid without a author' do
    book = build(:book, author: nil)
    book.validate
    expect(book.errors[:author].size).to eq 1
  end

  it 'is invalid without a title' do
    book = build(:book, title: nil)
    book.validate
    expect(book.errors[:title].size).to eq 1
  end

  it 'is valid with 80 length title' do
    book = build(:book, title: "#{'タイトル' * 20}")
    book.validate
    expect(book).to be_valid
  end

  it 'is invalid with over 80 length title' do
    book = build(:book, title: "#{'タイトル' * 20}あ")
    book.validate
    expect(book.errors[:title].size).to eq 1
  end

  describe '#categories' do
    let(:book_1) { create(:book) }
    let(:book_2) { create(:book) }
    let(:book_3) { create(:book) }
    let(:category_1) { create(:category) }
    let(:category_2) { create(:category) }
    let(:category_3) { create(:category) }

    it 'returns categorized categories' do
      category_1.books = [book_1, book_2]
      category_2.books = [book_2, book_3]
      category_3.books = [book_1, book_3]

      aggregate_failures do
        expect(book_1.categories).to contain_exactly(category_1, category_3)
        expect(book_2.categories).to contain_exactly(category_1, category_2)
        expect(book_3.categories).to contain_exactly(category_2, category_3)
      end
    end
  end
end
