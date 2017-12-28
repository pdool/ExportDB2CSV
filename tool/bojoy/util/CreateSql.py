#!/usr/bin/python3
# -*- coding: utf-8 -*-
import xlrd
def dealStr(str):
    d = str.replace(' ', '')
    d = d.replace('（', '')
    d = d.replace('(', '')
    d = d.replace(')', '')
    d = d.replace('）', '')
    d = d.replace('%', '')
    return d

def dealExcel():
    data = xlrd.open_workbook("D:\\文档\\02 策划文档\\5.12 SLG数据需求埋点.xlsx")
    # table = data.sheets()[0]
    sheet = data.sheet_by_name("兵力")
    print(sheet.nrows)

    configV = sheet.row_values(sheet.nrows - 1)  # 配置
    headV = sheet.row_values(sheet.nrows - 2)  # 头
    # MAX(CASE a.n_army_type WHEN 1 THEN  a.n_army_lvl ELSE 0 END)  军令1,
    # MAX(CASE a.n_army_type WHEN 1 THEN  a.n_idle ELSE 0 END)  军令2,
    # MAX(CASE a.n_army_type WHEN 1 THEN  a.n_injured ELSE 0 END)  军令3
    s = " MAX(CASE a.n_army_type WHEN "
    for i in range(23,33):
        if configV[i] != '' and headV[i] is not None and headV[i] != '':
            s1 = s + str(int(configV[i])) +" THEN  a.n_injured ELSE 0 END) ," + headV[i]+","
            print(s1)
if __name__ == '__main__':
    dealExcel()