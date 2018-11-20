require 'pg'

feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    visit '/bookmarks'
    expect(page).to have_text "http://www.destroyallsoftware.com"
  end
end
