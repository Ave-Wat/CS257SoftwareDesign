import BooksDataSource
import unittest

class BooksDataSourceTest(unittest.TestCase):
    def setUp(self):
        self.booksdatasource = BooksDataSource.BooksDataSource("test-books.csv","testauthors.csv")

    def tearDown():
        pass

'''------author() tests------'''
    def test_author_name(self):
        authorList = self.booksdatasource.authors("Brontë")
        testList = [{'id':13,'last_name':'Brontë','first_name':'Ann', 'birth_year':1820, 'death_year':1849},
        {'id':7,'last_name':'Brontë','first_name':'Charlotte', 'birth_year':1816, 'death_year':1855}]
        self.assertEqual(authorList,testList)

    def test_sort_birthyear(self):
        authorList = self.booksdatasource.authors()
        testList = [
        {'id':7,'last_name':'Brontë','first_name':'Charlotte', 'birth_year':1816, 'death_year':1855},
        {'id':13,'last_name':'Brontë','first_name':'Ann', 'birth_year':1820, 'death_year':1849},
        {'id':9,'last_name':'Gabriel García','first_name':'Márquez', 'birth_year':1927, 'death_year':2014},
        {'id':17,'last_name':'Alderman','first_name':'Naomi', 'birth_year':1974, 'death_year':None}
        ]

        self.assertEqual(authorList, testList)

    def test_author_id_valueError(self):
        with self.assertRaises(ValueError):
            self.booksdatasource.authors(-1)

    def test_return_none(self):
        #test to see what happens if author name is not in dataset
        authorList = self.booksdatasource.authors("Johnny")
        testList = []
        self.assertEqual(authorList,testList)

'''------books() tests------'''
    def test_title_sort(self):
        booksList = self.booksdatasource.books()
        testList = [
        {'title': '1Q84', 'publication_year': 2009, 'author_id': 15}
        {'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15}
        {'title': 'Love in the Time of Cholera', 'publication_year': 1985, 'author_id': 9}
        {'title': 'The Tenant of Wildfell Hall', 'publication_year': 1848, 'author_id': 14}
        {'title': 'Thief of Time', 'publication_year': 1996, 'author_id': 6}
        ]

        self.assertEqual(booksList,testList)

    def test_year_sort(self):
        booksList = self.booksDataSource.books(sort_by = 'years')
        testList = [
        {'title': 'The Tenant of Wildfell Hall', 'publication_year': 1848, 'author_id': 14}
        {'title': 'Hard-Boiled Wonderland and the End of the World', 'publication_year': 1985, 'author_id': 15}
        {'title': 'Love in the Time of Cholera', 'publication_year': 1985, 'author_id': 9}
        {'title': 'Thief of Time', 'publication_year': 1996, 'author_id': 6}
        {'title': '1Q84', 'publication_year': 2009, 'author_id': 15}
        ]

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
