require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one) # Load the fixture
  end

  test "should get new" do
    get new_book_path
    assert_response :success
  end

  test "should get create" do
    post books_path, params: { book: { title: @book.title, author: @book.author, price: @book.price, publishedDate: @book.publishedDate } }
    assert_response :redirect
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should get show" do
    get book_path(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_path(@book)
    assert_response :success
  end

  test "should get update" do
    patch book_path(@book), params: { book: { title: "Updated Title" } }
    assert_response :redirect
  end

  test "should get delete" do
    delete book_path(@book)
    assert_response :redirect
  end

  test "should get destroy" do
    delete book_path(@book)
    assert_response :redirect
  end
end
