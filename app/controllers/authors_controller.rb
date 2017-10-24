class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.page(params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to :authors, notice: t('messages.successfully_created', name: @author.name)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to :authors, notice: t('messages.successfully_updated', name: @author.name)
    else
      render :edit
    end
  end

  def destroy
    options = if @author.destroy
                {notice: t('messages.successfully_destroyed', name: @author.name)}
              else
                {alert: @author.errors.full_messages.join(' ')}
              end
    redirect_to :authors, options
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
