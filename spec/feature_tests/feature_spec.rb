require 'pg'

feature 'shows hello world on page' do
  scenario 'when user opens page see text hello world' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'shows bookmarks at the /bookmarks route' do
  scenario 'user visits /bookmarks and sees bookmarks' do
    Bookmark.create(url: "http://www.google.com")
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
  end
end

feature 'Add new bookmark' do
  scenario 'A user can add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://testbookmark.com'
  end
end
