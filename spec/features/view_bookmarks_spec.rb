require 'pg'

feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    Bookmarks.create(url: "http://www.makersacademy.com")
    Bookmarks.create(url: "http://www.destroyallsoftware.com")
    Bookmarks.create(url: "http://www.google.com")
    visit '/bookmarks'
    expect(page).to have_text "http://www.destroyallsoftware.com"
  end
end
