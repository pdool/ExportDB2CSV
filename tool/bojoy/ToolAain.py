#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys

from util.FileOperation import FileOp
from util.MySqlConn import MySQL
import os

if __name__ == '__main__':

    dayStr = input("输入查询日期(eg:2018_01_18):  ")

    conn = MySQL()
    conn.setDayStr(dayStr)

    rootPath = os.path.abspath('..\..')
    configList = FileOp.showContent(rootPath, "config.csv")
    for i in range(1, len(configList)):
        item = configList[i]
        sql = FileOp.readSql(rootPath + "\\sql", item[2] + ".sql")

        csvFile = FileOp(rootPath + "\\csvs", item[1] + ".csv")
        csvFile.addRow(item[3].split(","))
        # print(sql)
        try:
            sqlResult, r = conn.query(sql)

            # print( r)
            for x in r:
                csvFile.addRow(x)
            del csvFile

            filePath = rootPath + "\\csvs\\SQL\\" + item[2] + dayStr+".sql"
            with open(filePath, 'w') as f:
                f.write(sqlResult)
        except Exception as e:
            print("出现问题" + str(e))
    print("导出成功")
