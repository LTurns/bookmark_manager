
feature 'shows hello world on page' do
  scenario 'when user opens page see text hello world' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'shows bookmarks at the /bookmarks route' do
  scenario 'user visits /bookmarks and sees bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
  end
end
