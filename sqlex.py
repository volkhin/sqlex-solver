#!/usr/bin/env python

import urllib
import urllib2
import re

class WebWorker():
    opener = None
    login = ''
    password = ''

    def __init__(self):
        self.opener = urllib2.build_opener(urllib2.HTTPCookieProcessor())
        urllib2.install_opener(self.opener)

    def auth(self):
        url = "http://sql-ex.ru/index.php"
        values = {'login' : self.login,
                  'psw' : self.password }
        data = urllib.urlencode(values)
        response = self.opener.open(url, data)
        print 'Authentificated successfully'

    def fetch(self, url):
        response = self.opener.open(url)
        return response.read()

    def getCode(self, id):
        url = 'http://sql-ex.ru/learn_exercises.php?LN=' + str(id)
        print 'Fetching url: {0}'.format(url)
        response = self.fetch(url)
        regexp = re.compile(r"\<textarea[^>]*\>(.+)</textarea>", re.DOTALL)
        code = regexp.search(response)
        if code is None:
            return None
        result = code.group(1)
        return result

    def downloadAll(self):
        for i in range(1, 120):
            print "Downloading {0}th solution".format(i)
            code = worker.getCode(i)
            if code is not None:
                f = open("solutions/{0:03d}.sql".format(i), "w")
                f.write(code)
                f.close()

    def sendAll(self):
        for i in range(1, 120):
            try:
                filepath = "solutions/{0:03d}.sql".format(i)
                f = open(filepath, "r")
                print "Sending {0}th solution".format(i)
                code = f.read()
                f.close()
                self.fetch('http://sql-ex.ru/learn_exercises.php?LN={0}'.format(i))
                url = 'http://sql-ex.ru/learn_exercises.php'
                values = {'checkMe' : i, 'txtsql' : code}
                data = urllib.urlencode(values)
                response = self.opener.open(url, data)

            except Exception as inst:
                print inst

if __name__ == "__main__":
    worker = WebWorker()
    worker.auth()
    #worker.downloadAll()
    worker.sendAll()

