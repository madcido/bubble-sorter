def bubble_sort (arr)
  sorted = false
  until sorted do
    for x in (1...arr.length)
      if arr[x-1] > arr[x]
        arr[x-1], arr[x] = arr[x], arr[x-1]
        sorted = false
      else
        sorted = true
      end
    end
  end
  return arr
end
