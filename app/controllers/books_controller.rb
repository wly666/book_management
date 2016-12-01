class BooksController <ApplicationController

  before_action :find_book_by_id, :only=>[:edit, :update, :destroy, :show]
  before_filter :authorize

  def index
    @books = Book.all
    @books = @books.where("name like '%#{params[:book_name]}%'") if params[:book_name].present?
    @books = @books.where("author like '%#{params[:book_author]}%'") if params[:book_author].present?
    @books = @books.joins(:category).where("categories.name like ? ", "%#{params[:book_category]}%") if params[:book_category].present?
    @books = @books.joins(:tags).where("tags.name like ? ", "%#{params[:book_tag]}%") if params[:book_tag].present?
  end

  def new
    @book =  Book.new
  end

  def create
    Book.create :name=>params[:book][:name],
    :author=>params[:book][:author],
    :summary=>params[:book][:summary],
    :category_id=>params[:category_id],
    :status_id=>params[:status_id],
    :amount=>params[:book][:amount],
    :book_position=>params[:book][:book_position]
    book_id = Book.last.id
    params[:tag_group_id].each do |tag_id|
      Book.last.bookTags.create(:tag_id=>tag_id, :book_id=>book_id)
    end
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.name = params[:book][:name]
    @book.save
    redirect_to books_path
  end

  def destroy
    @book.delete
    redirect_to books_path
  end

  def show
    @count = Circulate.joins(:book).where("books.id=?", "#{params[:id]}").where("circulates.status_id=?", "1").count
  end

  def find_book_by_id
    @book = Book.find(params[:id])
  end
end
