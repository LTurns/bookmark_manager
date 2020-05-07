require 'spec_helper'
require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Test")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/bookmarks')

    expect(page).to have_link('Makers', href: "http://www.makersacademy.com")
    expect(page).to have_link('Test', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com")

  end
end
