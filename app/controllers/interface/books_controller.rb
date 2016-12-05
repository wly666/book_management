class Interface::BooksController <ActionController::Base
  def all
    all_books = Book.all.map do |book|
      {
        :id=>book.id,
        :name=>book.name,
        :author=>book.author,
        :book_position=>book.book_position,
        :tag_ids=>book.tag_ids
      }
    end
    render :json=>{
      :success => true,
      :result => all_books
    }
  end
end
