require 'bookmarks'
require 'database_helpers'

describe Bookmarks do
  describe '.list' do
    it 'should display a list of bookmarks' do

      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")

      bookmarks = Bookmarks.list

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      
      bookmarks = Bookmarks.list
      expect(bookmarks).not_to be_empty

      Bookmarks.delete(id: bookmark.id)
      bookmarks = Bookmarks.list

      expect(bookmarks).to be_empty
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      bookmarks = Bookmarks.list

      Bookmarks.update(id: bookmark.id, title: 'Academy Makers')
      updated_bookmarks = Bookmarks.list

      expect(updated_bookmarks[0].title).to eq('Academy Makers')
    end
  end
  

end
