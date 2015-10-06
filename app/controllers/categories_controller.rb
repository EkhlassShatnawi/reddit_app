class CategoriesController < ApplicationController
 
  def index
    if current_user.admin? 
      redirect_to  admin_categories_path 
    else 
      @categories = Category.all
    end
  end

  def new 
   @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @subcat = Category.where(id: @parent_id).all
    @post = Post.where(params[:id] == :id)
  end

  private
    def category_params
      params.require(:category).permit(:title , :parent_id)
    end
end
