#!/usr/bin/python3
# -*- coding: utf-8 -*-
from util.FileOperation import FileOp
from util.MySqlConn import MySQL
import os

if __name__ == '__main__':
    conn = MySQL()

    rootPath = os.path.abspath('..\..')
    configList = FileOp.showContent(rootPath, "config.csv")
    for i in range(1, len(configList)):
        item = configList[i]
        sql = FileOp.readSql(rootPath + "\\sql", item[2]+".sql")

        csvFile = FileOp(rootPath + "\\csvs", item[1]+".csv")
        csvFile.addRow(item[3].split(","))
        # print(sql)
        r = conn.query(sql)


        # print( r)
        for x in r:
            csvFile.addRow(x)

    print("xxxxxxxxxxxxxxxxx")
    i = input("")
