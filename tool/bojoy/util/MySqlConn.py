#!/usr/bin/python3
# -*- coding: utf-8 -*-
import pymysql


class MySQL(object):
    '''
    MySQL
    '''
    conn = ''
    cursor = ''

    def __init__(self, host='192.168.0.80',port=3300, user='root', passwd='123456', db='unity3dm_chongxin_db'):
        """MySQL Database initialization """
        self.conn = pymysql.connect(host=host, port=port,user=user, passwd=passwd, db=db,charset='utf8')
        self.cursor = self.conn.cursor()

    def query(self, sql):
        """  Execute SQL statement """
        self.cursor.execute(sql)
        # t = self.conn.store_result()
        # (field_info) =  t.describe()
        # print(field_info)
        return self.cursor.fetchall()

    def show(self):
        """ Return the results after executing SQL statement """
        return self.cursor.fetchall()

    def __del__(self):
        """ Terminate the connection """
        self.conn.close()
        self.cursor.close()

if __name__ == '__main__':
    conn = MySQL()
    r = conn.query("select * from union_task")
    print(r)
    pass
