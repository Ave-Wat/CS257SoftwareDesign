'''
   primecheckertests.py
   Jeff Ondich, 9 May 2012
   Updated for use in a lab exercise, 4 Nov 2013
'''

import primechecker
import unittest

class PrimeCheckerTester(unittest.TestCase):
    def setUp(self):
        self.prime_checker = primechecker.PrimeChecker(100)
        print("setUp")

    def tearDown(self):
        print("tearDown")
        pass

    def test_zero(self):
        print("test0")
        self.assertTrue(self.prime_checker.is_prime(0))

    def test_two(self):
        print("test2")
        self.assertTrue(self.prime_checker.is_prime(2))

    def test_prime(self):
        print("testprime")
        self.assertTrue(self.prime_checker.is_prime(97))

    def test_composite(self):
        print("test_composite")
        self.assertFalse(self.prime_checker.is_prime(96))

    def test_primes_below(self):
        print("test_primes_below")
        self.assertEqual(self.prime_checker.get_primes_below(20), [2, 3, 5, 7, 11, 13, 17, 19])

if __name__ == '__main__':
    unittest.main()
