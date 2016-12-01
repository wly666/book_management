class CategoriesController <ApplicationController

  before_action :find_category_by_id, :only=>[:edit, :destroy, :update]
  before_filter :authorize

  def index
    @categories = Category.all.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    Category.create :name=>params[:category][:name]
    redirect_to categories_path
  end

  def edit
  end

  def update
    @category.name = params[:category][:name]
    @category.save
    redirect_to categories_path
  end

  def destroy
    @category.delete
    redirect_to categories_path
  end

  def find_category_by_id
    @category = Category.find(params[:id])
  end

end
