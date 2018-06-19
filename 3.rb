# Question 3 -- changePossibilities(amount,amount): Your quirky boss
# collects rare, old coins. They found out you're a programmer and asked
# you to solve something they've been wondering for a long time.
#
# Write a function that, given an amount of money and an array of coin
# denominations, computes the number of ways to make the amount of money
# with coins of the available denominations.
#
# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢),
# your program would output 4—the number of ways to make 4¢ with
# those denominations:
#
# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 2¢, 2¢
# 1¢, 3¢

def change_possibilities(amount, nums)
  tally = {}
  i = 0
  while i < nums.size
    sum = nums[i]
    hold = [nums[i]]
    j = 0
    jcount = 0
    while j < nums.size
      if sum + nums[j] <= amount
        sum += nums[j]
        hold << nums[j]
      else
        if jcount < nums.size
          j -= 1
          jcount += 1
        else
          j += 1
        end
        if sum === amount
          tally[hold.sort.map(&:to_s).join] = sum
          sum = nums[i]
          hold = [nums[i]]
        end
      end
      i += 1 if j >= nums.size
    end
  end
  tally.keys.size
end

# p change_possibilities(3, [3, 2, 1]) #=== 3
# p change_possibilities(4, [1, 2, 3]) #=== 4
p change_possibilities(6, [1, 2, 3]) #=== 7

### 3 ###
# 3
# 2, 1
# 1, 1, 1

### 4 ###
# 3, 1
# 2, 2
# 2, 1, 1
# 1, 1, 1, 1

### 6 ###
# 3, 3
# 3, 2, 1
# 3, 1, 1, 1
# 2, 2, 2
# 2, 2, 1, 1
# 2, 1, 1, 1, 1
# 1, 1, 1, 1, 1, 1

#
# def change_possibilities(amount, nums)
#   tally = {}
#   i = 0
#   while i < nums.size
#     sum = nums[i]
#     hold = [nums[i]]
#     j = 0
#     jcount = 0
#     while j < nums.size
#       if sum + nums[j] <= amount
#         sum += nums[j]
#         hold << nums[j]
#       end
#       if sum + nums[j] > amount
#         if jcount < nums.size
#           j -= 1
#           jcount += 1
#         else
#           j += 1
#         end
#         if sum === amount
#           tally[hold.sort.map(&:to_s).join] = sum
#           sum = nums[i]
#           hold = [nums[i]]
#         end
#       end
#       i += 1 if j >= nums.size
#     end
#   end
#   tally.keys.size
# end
