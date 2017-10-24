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
end
