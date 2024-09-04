require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and shows book' do
    visit '/books/new'

    fill_in 'Title', with: 'Hello World'

    click_on 'Create Book'
    expect(page).to have_content('Hello World')

    book = Books.order(:id).last
    expect(book.title).to eq('Hello World')
  end
end
