class Admin::CategoriesController < Admin::BaseController

  def index
    @admin = current_user
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New Category Saved!"
      redirect_to admin_categories_path
    else
      flash[:error] = "Error, #{@categroy.errors.keys}, #{@category.errors.values}"
      render :new
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category Updated!"
      redirect_to admin_categories_path
    else
      flash[:error] = "Error, #{@category.errors.keys}, #{@category.errors.values}"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Category Deleted!"
      redirect_to admin_categories_path
    else
      flash[:error] = "Error, #{@category.errors.keys}, #{@category.errors.values}"
      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
