class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash.alert = "Created book: #{@book.title}"
      redirect_to books_path
    else
      flash.alert = "Failed to save the book"
      render("new")
    end
  end

  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.alert = "Edited book: #{@book.title}"
      redirect_to books_path
    else
      render("edit")
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    flash.alert = "Deleted book: #{@book.title}"
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :description, :price, :publishedDate)
  end
end
