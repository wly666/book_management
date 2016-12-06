class MainsController <ApplicationController

  before_filter :authorize

  def index
     authorize! :read, :message=>"没有权限"
  end
end
