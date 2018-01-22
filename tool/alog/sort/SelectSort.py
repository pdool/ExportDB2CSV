#!/usr/bin/python3
# -*- coding: utf-8 -*-

# 选择排序注意点(假设第一层循环变量为：i;第二层循环变量为：j)：
# [0,i-1]是已经排序好的元素。
# 定义一个变量，用来记录本次循环下找到的最小元素的下标。
# 第二层循环是从[i,length -1]中找到最小元素的下标，用来与i元素交换。
def selectSort(nums):
    for i in range(len(nums)-1):
        for j in range(i + 1,len(nums)-1):
            if nums[i] > nums[j]:
                t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
    for x in nums:
        print(x)

def selectSortEx(nums):
    l = []
    nl = len(nums)
    for i in range(nl):
        t = nums[0]
        ti = 0
        for j in range(len(nums)):
            if  nums[j] < t:
                t = nums[j]
                ti = j
        # l.append(t)
        l.insert(i,t)
        del nums[ti]


    for x in l:
        print(x)



if __name__ == '__main__':
    nums = [10, 8, 2, 15, 21, 11]
    selectSortEx(nums)
    pass
