class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def show
    @category = Category.find(params[:id])
    @category_expenses = @category.expenses.all
  end

  def new
    @category = Category.new
    @icons = icons
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:notice] = 'Category created succesfully'
      redirect_to new_category_expense_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
    flash[:notice] = if @category.destroy
                       'Category removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def icons
    { 'Grocery' => 'icon0.png', 'Shopping' => 'icon1.png', 'Transportation' => 'icon2.png', 'Education' => 'icon3.png',
      'Bills' => 'icon4.png', 'Insurance' => 'icon5.png', 'Travel' => 'icon6.png', 'Home' => 'icon7.png',
      'Technology' => 'icon8.png', 'Electricity' => 'icon9.png' }
  end
end
