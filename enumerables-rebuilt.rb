module Enumerable

  def my_each
    for i in (0...self.to_a.length)
      yield(self.to_a[i])
    end
    self
  end

  def my_each_with_index
    for i in (0...self.to_a.length)
      yield(self.to_a[i], i)
    end
    self
  end

  def my_select
    selected = []
    self.my_each {|x| selected << x if yield(x)}
    selected
  end

  def my_all?
    self.my_each {|x| return false unless yield(x)}
    true
  end

  def my_any?
    self.my_each {|x| return true if yield(x)}
    false
  end

  def my_none?
    self.my_each {|x| return false if yield(x)}
    true
  end

  def my_count (arg = (no_arg = true))
    counter = 0
    if no_arg && block_given?
      self.my_each {|x| counter += 1 if yield(x)}
    elsif no_arg
      self.my_each {counter += 1}
    else
      self.my_each {|x| counter += 1 if x == arg}
    end
    counter
  end

  def my_inject (arg = (no_arg = true; nil))
    memo = arg
    self.my_each do |x|
      memo = yield(memo,x) if memo
      memo ||= x
    end
    memo
  end

  def my_map (arg = (no_arg = true; nil))
    mapped = []
    if no_arg || !(arg.is_a? Proc)
      self.my_each {|x| mapped << yield(x)}
    else
      self.my_each {|x| mapped << arg.call(x)}
    end
    mapped
  end

end


#testing as assigned
def multiply_els (arr)
  arr.my_inject {|product, x| product * x }
end
puts multiply_els([2,4,5])

puts [1,2,3,4,5].my_inject {|a,b| a+b}
puts [1,2,3,4,5].my_inject {|a,b| a*b}
puts [1,2,3,4,5].my_inject {|a,b| a-b}
