from app import app

import os
import unittest

class AppTestCase(unittest.TestCase):

   def test_root_text(self):
        tester = app.test_client(self)
        response = tester.get('/')
        assert 'this is arun' in response.data

if __name__ == '__main__':
    unittest.main()
