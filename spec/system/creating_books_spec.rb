require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and shows book' do
    visit '/books/new'

    fill_in 'Title', with: 'Hello World'
    fill_in 'Author', with: 'Hello World'
    fill_in 'Price', with: "1.5"

    select '2023', from: 'book_publishedDate_1i' # Year
    select 'October', from: 'book_publishedDate_2i' # Month
    select '15', from: 'book_publishedDate_3i' # Day

    click_on 'Create Book'

    expect(page).to have_content('Created book: Hello World') # The flash message

    book = Book.order(:id).last
    expect(book.title).to eq('Hello World')
    expect(book.author).to eq('Hello World')
    expect(book.price).to eq(1.5)
    expect(book.publishedDate).to eq(Date.new(2023, 10, 15))
  end

  it 'does not save book without title' do
    visit '/books/new'
    fill_in 'Author', with: 'Hello World'
    fill_in 'Price', with: '1.5'

    select '2023', from: 'book_publishedDate_1i' # Year
    select 'October', from: 'book_publishedDate_2i' # Month
    select '15', from: 'book_publishedDate_3i' # Day

    click_on 'Create Book'
    expect(page).to have_content('Failed to save the book') # The flash message
  end

  it 'does not save book without author' do
    visit '/books/new'

    click_on 'Create Book'
    expect(page).to have_content('Failed to save the book') # The flash message
  end

  it 'does not save book without author' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello World'
    fill_in 'Price', with: '1.5'

    select '2023', from: 'book_publishedDate_1i' # Year
    select 'October', from: 'book_publishedDate_2i' # Month
    select '15', from: 'book_publishedDate_3i' # Day

    click_on 'Create Book'
    expect(page).to have_content('Failed to save the book') # The flash message
  end

  it 'does not save book without price' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello World'
    fill_in 'Author', with: 'Hello World'

    select '2023', from: 'book_publishedDate_1i' # Year
    select 'October', from: 'book_publishedDate_2i' # Month
    select '15', from: 'book_publishedDate_3i' # Day

    click_on 'Create Book'
    expect(page).to have_content('Failed to save the book') # The flash message
  end
end
