class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  # Methods omitted
  def new 
   @category = Category.new
  end

  def index 
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
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
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to  admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @subcat = Category.where(parent_id: @category.id).find_each do |item|
      item.destroy
    end
    @category.destroy
    redirect_to admin_categories_path
  end
  
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  private
    def category_params
      params.require(:category).permit(:title , :parent_id)
    end

end
