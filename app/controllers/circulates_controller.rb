class CirculatesController <ApplicationController

  before_filter :authorize

  def index
    @circulates = Circulate.all.page(params[:page]).per(10)
  end

  def new
    @circulate = Circulate.new
  end

  def create
    Circulate.create :book_id=>params[:circulate][:book_id],
      :user_id=>current_user.id,
      :borrow_date=>params[:circulate][:borrow_date],
      :expect_back_date=>params[:circulate][:expect_back_date],
      :book_status_id=>"1",
      :status_id=>"1"
    redirect_to success_books_path
  end

  def edit
    @circulate = Circulate.find(params[:id])
  end

  def update
    @circulate = Circulate.find(params[:id])
    @circulate.back_date = params[:circulate][:back_date]
    @circulate.book_status_id = params[:book_status_id]
    @circulate.status_id = "0"
    @circulate.save
    redirect_to circulates_path
  end

  def tongji
    @books = Book.select('books.*, count(circulates.id) as count').joins(:circulates).group(:id)
    @books = @books.joins(:tags).where("tags.name like ? ", "%#{params[:book_tag]}%") if params[:book_tag].present?
  end

  def usersTongji
    @users = User.joins(:circulates).where("circulates.book_id=?", params[:book_id]).group(:id)
  end
end
