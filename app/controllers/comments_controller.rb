class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
    @comment = @post.comments.create(comment_params)
    
    if @comment.save
      redirect_to category_post_path(@category,@post)
    else
      render 'new'
    end
  end
  
  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:body , :user_name)
    end
end
