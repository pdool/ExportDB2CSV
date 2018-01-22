#!/usr/bin/python3
# -*- coding: utf-8 -*-

def bubbleSor(nums):
    for i in range(len(nums) - 1):
        for j in range(len(nums) - i - 1):
            if nums[j] > nums[j + 1]:
                temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp

    for x in nums:
        print(x)


if __name__ == '__main__':
    nums = [10, 8, 2, 15, 21, 11]
    bubbleSor(nums)
    pass
