require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'has a valid factory' do
    author = build(:author)
    expect(author).to be_valid
  end

  it 'is invalid without a name' do
    author = build(:author, name: nil)
    author.validate
    expect(author.errors[:name].size).to eq 1
  end

  it 'is valid with 40 length name' do
    author = build(:author, name: '山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎')
    author.validate
    expect(author).to be_valid
  end

  it 'is invalid with over 40 length name' do
    author = build(:author, name: '山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎山田太郎a')
    author.validate
    expect(author.errors[:name].size).to eq 1
  end

  describe '#books' do
    let(:author) { create(:author) }

    it 'returns books the author written' do
      create_list(:book, 3, author: author)
      create_list(:book, 4, author: create(:author))

      expect(author.books.size).to eq 3
    end
  end
end
