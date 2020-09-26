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
        with self.assertRaises(ValueError):
            self.prime_checker.is_prime(0)

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

    def test_negative(self):
        print("test_negative")
        with self.assertRaises(ValueError):
            self.prime_checker.is_prime(-1)

    def test_letter(self):
        print("test_letter")
        with self.assertRaises(TypeError):
            self.prime_checker.is_prime("i")

    def test_large_num(self):
        print("test_large_num")
        with self.assertRaises(ValueError):
            self.prime_checker.is_prime(101)

    def test_below_negative(self):
        print("test_below_negative")
        with self.assertRaises(AssertionError):
            self.prime_checker.get_primes_below(-1)

if __name__ == '__main__':
    unittest.main()
