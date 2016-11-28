class BooksController <ApplicationController
  
  before_action :find_book_by_id, :only=>[:edit, :update, :destroy]

  def index
    @books = Book.all
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

  def find_book_by_id
    @book = Book.find(params[:id])
  end
end
