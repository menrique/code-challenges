# https://leetcode.com/problems/contains-duplicate/
#
# 217. Contains Duplicate
# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
#
# Example 1:
# Input: nums = [1,2,3,1]
# Output: true
#
# Example 2:
# Input: nums = [1,2,3,4]
# Output: false
#
# Example 3:
# Input: nums = [1,1,1,3,3,4,3,2,4,2]
# Output: true
#
# Constraints:
# 1 <= nums.length <= 105
# -109 <= nums[i] <= 109

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  result = false
  previous = {}

  nums.each do |num|
    if previous[num] != nil
      result = true
      break
    else
      previous[num] = true
    end
  end

  result
end

require "#{__dir__}/run"

examples = {
  [1,2,3,1] => true,
  [1,2,3,4] => false,
  [1,1,1,3,3,4,3,2,4,2] => true
}

run(examples){|nums| contains_duplicate(nums)}