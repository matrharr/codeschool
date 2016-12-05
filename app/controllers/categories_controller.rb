class CategoriesController < ApplicationController
  before_filter :authorize, :except => [:show, :index]

  def index
    @categories = Category.all.order('created_at ASC')
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Successfully created category!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Error creating new category!"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Successfully updated category!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Error updating category!"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to categories_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :intro)
  end

end
