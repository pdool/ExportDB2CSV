#!/usr/bin/python3
# -*- coding: utf-8 -*-
from util.FileOperation import FileOp
from util.MySqlConn import MySQL
import os

if __name__ == '__main__':
    conn = MySQL()

    # f = FileOp("e:\\hhh2", "Test.csv")

    print(os.path.abspath('..\..'))
    folderName = os.path.abspath('..\..') +"\\sql"
    s = FileOp.readSql(folderName,"引导进度.sql")
    print(s)
    r = conn.query(s)
    for x in r:
        print(x)
    pass
