module Enumerable

  def my_each
    for i in (0...self.length)
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in (0...self.length)
      yield(self[i], i)
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

  def my_count(arg = (no_arg = true))
    counter = 0
    if no_arg && block_given?
      self.my_each {|x| counter += 1 if yield(x)}
    elsif no_arg
      counter = self.length
    else
      self.my_each {|x| counter += 1 if x == arg}
    end
    counter
  end

  def my_inject

  end

  def my_map

  end

end
