__author__ = 'wuguojun'
import configparser
import os


CONFIGURATIONINFO={}

class configInfo(object):
    def __init__(self,filename=''):
        self.filename = filename

    def readEnv(self):
        global CONFIGURATIONINFO
        curr_dir = os.getcwd()
        paths = curr_dir+'\\features\\env.config'
        if paths not in CONFIGURATIONINFO.keys() :
            config = configparser.ConfigParser()
            config.read(paths,encoding='utf-8')
            CONFIGURATIONINFO[paths]=config
        return CONFIGURATIONINFO[paths]

    def readTestData(self):
        global CONFIGURATIONINFO
        curr_dir = os.getcwd()
        paths = curr_dir+'\\features\\test_data\\'+self.filename
        if paths not in CONFIGURATIONINFO.keys() :
            config = configparser.ConfigParser()
            config.read(paths,encoding='utf-8')
            CONFIGURATIONINFO[paths]=config
        return CONFIGURATIONINFO[paths]


if __name__ == "__main__":
    print(configInfo().readEnv().get('test','ip'))
    configInfo().readTestData()