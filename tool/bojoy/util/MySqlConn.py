#!/usr/bin/python3
# -*- coding: utf-8 -*-
import datetime

import pymysql
import time
from win32timezone import now


class MySQL(object):
    '''
    MySQL
    '''
    db = "unity3dm_cn_cn_db."
    logdb = "unity3dm_cn_cn_log."

    def __init__(self, host='192.168.0.80', port=3300, user='root', passwd='123456', db='unity3dm_cn_cn_wrdlog'):
        """MySQL Database initialization """
        self.conn = pymysql.connect(host=host, port=port, user=user, passwd=passwd, db=db, charset='utf8')
        self.cursor = self.conn.cursor()

    def query(self, sql):
        """  Execute SQL statement """
        self.conn.autocommit(False)
        sql = self.replaceSql(sql)
        # print('\033[1;31;40m')
        # print(sql)
        self.cursor.execute(sql)

        self.conn.commit()
        # t = self.conn.store_result()
        # (field_info) =  t.describe()
        # print(field_info)
        return self.cursor.fetchall()

    def show(self):
        """ Return the results after executing SQL statement """
        return self.cursor.fetchall()

    def __del__(self):
        """ Terminate the connection """
        self.cursor.close()
        self.conn.close()

    def replaceSql(self, sql):
        now = datetime.datetime.now()
        dateStr = now.strftime('%Y_%m')
        sql = sql.replace("{db.}", self.db)
        sql = sql.replace("{logdb.}", self.logdb)
        sql = sql.replace("{date}", dateStr)
        return sql


if __name__ == '__main__':
    now = datetime.datetime.now()
    s = now.strftime('%Y_%m')
    print('\033[1;31;40m')
    print(s)
    print("\033[0m ")
