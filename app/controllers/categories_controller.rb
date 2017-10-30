class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to :categories, notice: t('messages.successfully_created', name: @category.name)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to :categories, notice: t('messages.successfully_updated', name: @category.name)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to :categories, notice: t('messages.successfully_destroyed', name: @category.name)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
