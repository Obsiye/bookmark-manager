require 'database_connection'

describe DatabaseConnection do
	
	describe '.setup' do
		it 'takes database name as argument' do
			expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

			DatabaseConnection.setup('bookmark_manager_test')
		end
	end

	describe '.query' do
		it 'executes SQL query string on the correct database' do
			connection = DatabaseConnection.setup('bookmark_manager_test')

			sql_query = "SELECT * FROM bookmarks;"
			
			connection.query(sql_query)
		end
	end

end
