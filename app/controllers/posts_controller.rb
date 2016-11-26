class PostsController < ApplicationController
  before_filter :authorize, :except => [:show, :index]
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    p params[:post][:category_id]
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to category_post_path(params[:post][:category_id], @post.id)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    p @post
    p '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
  end

  def update
    @post = Post.find(params[:id])
    @category = @post.category
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to category_post_path(@category, @post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end








