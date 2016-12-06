class TagsController <ApplicationController

  before_action :find_tag_by_id, :only=>[:edit, :update, :destroy]
  before_filter :authorize

  def index
    authorize! :read, :message=>"没有权限"
    @tags = Tag.all.page(params[:page]).per(10)
  end

  def new
    authorize! :create, :message=>"没有权限"
    @tag = Tag.new
  end

  def create
    Tag.create :name=>params[:tag][:name]
    redirect_to tags_path
  end

  def edit
    authorize! :update, :message=>"没有权限"
  end

  def update
    @tag.name = params[:tag][:name]
    @tag.save
    redirect_to tags_path
  end

  def destroy
    authorize! :destroy, :message=>"没有权限"
    @tag.delete
    redirect_to tags_path
  end

  def find_tag_by_id
    @tag = Tag.find(params[:id])
  end

end
