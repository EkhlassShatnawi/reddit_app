class PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
    
    if @post.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @vote = Vote.new
  end

  private
    def post_params
      params.require(:post).permit(:description ,:user_name ,:post_type)
    end
end
