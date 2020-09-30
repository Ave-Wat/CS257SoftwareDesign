import BooksDataSource
import unittest

class BooksDataSourceTest(unittest.TestCase):
    def setUp(self):
        self.booksdatasource = BooksDataSource.BooksDataSource("test-books.csv","testauthors.csv")

    def tearDown():
        pass

    #author tests
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
        authorList = authorList = self.booksdatasource.authors("Johnny")
        testList = []
        self.assertEqual(authorList,testList)

    #books tests
    def test_title_sort(self):
        pass

    def test_year_sort(self):
        pass

    def test_author_id():
        pass

    def test_search_text():
        pass

    def test_start_year():
        pass

    def test_end_year():
        pass

    def test_start_and_end_years():
        pass

if __name__ == '__main__':
    unittest.main()
