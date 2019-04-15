def bubble_sort (arr)
  full_sorted = false    #this will only be true when the whole array is sorted
  until full_sorted do
    swaps = 0    #counter to check how many swaps were made during this iteration
    for x in (1...arr.length)
      if arr[x-1] > arr[x]    #if the left item is bigger than the right item, they swap places and swaps counter is incremented
        arr[x-1], arr[x] = arr[x], arr[x-1]
        swaps += 1
      end
    end
    if swaps == 0    #if no swaps were made, then it's sorted and quits the until loop
      full_sorted = true
    end
  end
  return arr
end

p bubble_sort [3,9,7,8,5,7,8,4,2,3,6,2,6,78,8,76,3,4,54,6,4,12,1]
p bubble_sort ["cat", "ubuntu", "anna", "onion", "banana"]
