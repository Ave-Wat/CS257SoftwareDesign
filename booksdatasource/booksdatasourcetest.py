import BooksDataSource
import unittest

class BooksDataSourceTest(unittest.TestCase):
    def setUp(self):
        self.booksdatasource = BooksDataSource.BooksDataSource("test-books.csv","testauthors.csv")

    def tearDown():
        pass

    #author tests
    def test_author_name():
        pass

    def test_sort_birthyear():
        pass

    def test_return_none():
        #test to see what happens if author name is not in dataset
        pass

    #books tests
    def test_title_sort():
        pass

    def test_year_sort():
        pass

    def test_author_id(self):
        with self.assertRaises(ValueError):
            self.booksdatasource.books(author_id=-1)

    def test_search_text(self):
        self.assertEqual(self.booksdatasource.books(search_text='of'),[{'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15},{'title': 'Love in the Time of Cholera', 'publication_year': 1985, 'author_id': 9},{'title': 'The Tenant of Wildfell Hall', 'publication_year': 1848, 'author_id': 14},{'title': 'Thief of Time', 'publication_year': 1996, 'author_id': 6}])

    def test_start_year(self):
        self.assertEqual(self.booksdatasource.books(start_year=1990),[{'title': '1Q84', 'publication_year': 2009, 'author_id': 15},{'title': 'Thief of Time', 'publication_year': 1996, 'author_id': 6}])

    def test_end_year(self):
        self.assertEqual(self.booksdatasource.books(end_year=1990),[{'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15},{'title': 'Love in the Time of Cholera', 'publication_year': 1985, 'author_id': 9},{'title': 'The Tenant of Wildfell Hall', 'publication_year': 1848, 'author_id': 14}])

    def test_start_and_end_years(self):
        self.assertEqual(self.booksdatasource.books(start_year=1848,end_year=1986),[{'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15},{'title': 'Love in the Time of Cholera', 'publication_year': 1985, 'author_id': 9},{'title': 'The Tenant of Wildfell Hall', 'publication_year': 1848, 'author_id': 14}])
    
    def test_all_parameters(self):
        self.assertEqual(self.booksdatasource.books(author_id=15, search_text='of',start_year=1848,end_year=2010,sort_by='year'),[{'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15}])

if __name__ == '__main__':
    unittest.main()
