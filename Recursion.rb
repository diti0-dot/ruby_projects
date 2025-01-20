#FIBS

puts "Enter a number:"
    num = gets.to_i

def fibs(num)
    if num == 0
        return [0]
    elsif num == 1
        return [0,1]
    else
        my_array = [0, 1]
        (2...num).each do |i|
        my_array << my_array[i-1] + my_array[i-2]
     end 
     return my_array.inspect
    end 
end 

puts fibs(num)

#FIBS_REC
puts "Enter a number:"
n = gets.to_i

def fibs_rec(n, memo = {})
    return 0 if n == 0
    return 1 if n == 1
    return memo[n] if memo[n]

    memo[n] = fibs_rec(n - 1, memo) + fibs_rec(n - 2, memo)
    return memo[n]
end

puts "Fibonacci number at position #{n}: #{fibs_rec(n)}"

#MERGE SORT 
nums_arr = [3, 2, 1, 13, 8, 5, 0]

def merge_sort(nums_arr)
  return nums_arr if nums_arr.length <= 1
  
  mid = nums_arr.length / 2
  left = merge_sort(nums_arr[0...mid])  
  right = merge_sort(nums_arr[mid..-1])  

  merge(left, right)  
end

def merge(left, right)
  sorted = []

  while !left.empty? && !right.empty?
    if left[0] < right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

puts "Sorted array: "
puts merge_sort(nums_arr).inspect


