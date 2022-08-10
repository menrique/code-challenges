# https://leetcode.com/problems/permutation-in-string/
#
# 567. Permutation in String
# Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
# In other words, return true if one of s1's permutations is the substring of s2.
#
# Example 1:
# Input: s1 = "ab", s2 = "eidbaooo"
# Output: true
# Explanation: s2 contains one permutation of s1 ("ba").
#
# Example 2:
# Input: s1 = "ab", s2 = "eidboaoo"
# Output: false
#
#
# Constraints:
# 1 <= s1.length, s2.length <= 104
# s1 and s2 consist of lowercase English letters.

# @param {String} s1
# @param {String} s2
# @return {Boolean}
# def check_inclusion(s1, s2)
#   return true if s2.include?(s1)
#   # return false unless s1.chars.uniq.all?{|char| s2.include?(char)}
#
#   s1.chars.permutation.any?{|seq| s2.include?(seq.join)}
# end

def check_inclusion(s1, s2)
  def check_and_permute(s1, s2, length)
    puts [s1, s2, length].inspect
    return true if s2.include?(s1)
    return false if length == 1

    prev_length = length - 1
    (0..prev_length).any? do |i|
      result = check_and_permute(s1, s2, prev_length)
      if length.even?
        s1[i], s1[prev_length] = s1[prev_length], s1[i]
      else
        s1[0], s1[prev_length] = s1[prev_length], s1[0]
      end
      result
    end
  end

  check_and_permute(s1, s2, s1.length)
end

require "#{__dir__}/run"

examples = {
  %w[ba eidbaooo] => true,
  %w[ab eidbaooo] => true,
  %w[ab eidboaoo] => false,
  %w[oab eidboaoo] => true,
  %w[a1b eidboaoo] => false,
}

run(examples){|args| check_inclusion(*args)}