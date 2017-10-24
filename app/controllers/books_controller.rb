class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_author_existence
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:new, :create, :edit, :update]

  def index
    @books = Book.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to :books, notice: t('messages.successfully_created', name: @book.title)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to :books, notice: t('messages.successfully_updated', name: @book.title)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to :books, notice: t('messages.successfully_destroyed', name: @book.title)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author_id)
  end

  def set_options
    @author_options = Author.pluck(:name, :id)
  end

  def check_author_existence
    redirect_to :authors, alert: t('messages.no_author_exist') if Author.count.zero?
  end
end
