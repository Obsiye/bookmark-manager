feature 'update bookmark' do
    scenario 'update an existing bookmark' do
        bookmark = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
        visit('/bookmarks')
        expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

        first('.bookmark').click_button('Update')
        expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

        fill_in('url', with: 'http://www.academymakers.com')
        fill_in('title', with: 'Academy Makers')
        click_button('Update')

        expect(current_path).to eq('/bookmarks')
        expect(page).not_to have_content('Makers Academy')

        expect(page).to have_content('Academy Makers')
    end
end
