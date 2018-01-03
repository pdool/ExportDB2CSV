#!/usr/bin/python3
# -*- coding: utf-8 -*-
import datetime

from sshtunnel import SSHTunnelForwarder
import pymysql


class MySQL(object):
    '''
    MySQL
    '''
    db = "unity3dm_cn_cn_db341000000."
    logdb = "unity3dm_cn_cn_log341000000."

    def __init__(self):
        """MySQL Database initialization """
        server = SSHTunnelForwarder(
                ssh_address_or_host =('118.89.188.233', 528),  # B机器的配置
                ssh_password="KNL2QvVDAuTgtE3B",
                ssh_username="root",
                local_bind_address=('127.0.0.1', 3306),  # 绑定的端口
                remote_bind_address=('10.66.220.202', 3306))
        # 代理远程的端口
        server.start()
        self.conn =  pymysql.connect(host='127.0.0.1',  # 此处必须是是127.0.0.1
                           port=3306,
                           user='root',
                           passwd='SPQ7C7ZR4yvz6Q^^',
                           db='unity3dm_cn_cn_db341000000',
                            charset='utf8')

        # self.conn = pymysql.connect(host=host, port=port, user=user, passwd=passwd, db=db, charset='utf8')
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
