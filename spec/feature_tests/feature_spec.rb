require 'spec_helper'
require 'pg'

feature 'shows hello world on page' do
  scenario 'when user opens page see text hello world' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'shows bookmarks at the /bookmarks route' do
  scenario 'user visits /bookmarks and sees bookmarks' do
    Bookmark.create(url: "http://www.google.com", title: 'Google')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end

feature 'Add new bookmark' do
  scenario 'A user can add a new bookmark' do
    visit('/bookmarks/new')
    #Bookmark.create(url: "http://testbookmark.com", title: 'Test Bookmark')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
  end
end

feature 'Delete a bookmark' do
  scenario 'Click button to remove bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks/:id'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
