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
    result = true
    self.my_each {|x| result &&= yield(x)}
    result
  end

  def my_any?
    result = false
    self.my_each {|x| result ||= yield(x)}
    result
  end

  def my_none?
    result = false
    self.my_each {|x| result ||= yield(x)}
    !result
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

  def my_inject (arg = (no_arg = true))
    if no_arg
      memo = self.to_a[0]
      for i in (1...self.to_a.length)
        memo = yield(memo, self.to_a[i])
      end
    else
      memo = arg
      self.my_each {|x| memo = yield(memo, x)}
    end
    memo
  end

  def my_map (arg = (no_arg = true))
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
