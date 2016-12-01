class BooksController <ApplicationController

  before_action :find_book_by_id, :only=>[:edit, :update, :destroy, :show]
  before_filter :authorize

  def index
    @books = Book.all.page(params[:page]).per(10)
    @books = @books.where("name like '%#{params[:book_name]}%'") if params[:book_name].present?
    @books = @books.where("author like '%#{params[:book_author]}%'") if params[:book_author].present?
    @books = @books.joins(:category).where("categories.name like ? ", "%#{params[:book_category]}%") if params[:book_category].present?
    @books = @books.joins(:tags).where("tags.name like ? ", "%#{params[:book_tag]}%") if params[:book_tag].present?
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create book_params
    #  :name=>params[:book][:name],
    #  :author=>params[:book][:author],
    #  :summary=>params[:book][:summary],
       #:category_id=>params[:category_id]
    #  :status_id=>params[:status_id],
    #  :amount=>params[:book][:amount],
    #  :book_position=>params[:book][:book_position],
    #  :tag_group_ids => params[:book][:tag_group_ids]

    #book_id = @book.id
    #params[:tag_group_id].each do |tag_id|
    #  @book.bookTags.create(:tag_id=>tag_id, :book_id=>book_id)
    #end
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.update book_params
    #@book.name = params[:book][:name]
    #@book.author = params[:book][:author]
    #@book.summary = params[:book][:summary]
    #@book.category_id = params[:category_id]
    #@book.status_id = params[:status_id]
    #@book.amount = params[:book][:amount]
    #@book.book_position = params[:book][:book_position]
    #@book.save
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

private
  def book_params
    params.require(:book).permit!
  end
end
