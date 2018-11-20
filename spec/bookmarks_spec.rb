require 'bookmarks'

describe Bookmarks do
  describe '.list' do
    it 'should display a list of bookmarks' do
      bookmarks = Bookmarks.list
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
