class TagsController <ApplicationController

  before_action :find_tag_by_id, :only=>[:edit, :update, :destroy]
  before_filter :authorize

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    Tag.create :name=>params[:tag][:name]
    redirect_to tags_path
  end

  def edit
  end

  def update
    @tag.name = params[:tag][:name]
    @tag.save
    redirect_to tags_path
  end

  def destroy
    @tag.delete
    redirect_to tags_path
  end

  def find_tag_by_id
    @tag = Tag.find(params[:id])
  end

end
