feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_text "http://www.destroyallsoftware.com"
  end
end
