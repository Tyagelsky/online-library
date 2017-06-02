class CategoriesController < ApplicationController
  before_action :set_category, only: [:show,:edit,:update,:destroy]
  before_action :require_admin, except: [:index,:show]

  def index
    @categories = Category.paginate(page: params[:page],per_page: 5)
  end

  def show

  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
     @category = Category.new(category_params)
     if @category.save
       flash[:success] = "The category was successfuly created"
       redirect_to categories_path
     else
       render 'new'
     end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "The category was successfuly edited"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "The category was successfuly deleted"
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def require_admin
       if  !current_user.admin?
         redirect_to categories_path
       end
    end

end
