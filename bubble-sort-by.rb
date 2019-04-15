def bubble_sort_by (arr)
  full_sorted = false   #this will only be true when the whole array is sorted
  until full_sorted do
    swaps = 0   #counter to check how many swaps were made during this iteration
    for x in (1...arr.length)
      if yield(arr[x-1], arr[x]) > 0   #check the block comparison and swap if needed
        arr[x-1], arr[x] = arr[x], arr[x-1]
        swaps += 1
      end
    end
    if swaps == 0   #if no swaps were made, then it's sorted and quits the until loop
      full_sorted = true
    end
  end
  return arr
end

p bubble_sort_by([3,9,7,8,5,7,8,4,2,3,6,2,6,78,8,76,3,4,54,6,4,12,1]) {|a, b| a <=> b}
p bubble_sort_by([3,9,7,8,5,7,8,4,2,3,6,2,6,78,8,76,3,4,54,6,4,12,1]) {|a, b| b <=> a}

p bubble_sort_by (["cat", "ubuntu", "anna", "onion", "banana"]) {|a, b| a <=> b}
p bubble_sort_by (["cat", "ubuntu", "anna", "onion", "banana"]) {|a, b| b <=> a}

p bubble_sort_by(["hi","hello","hey"]) {|left, right| left.length - right.length}
