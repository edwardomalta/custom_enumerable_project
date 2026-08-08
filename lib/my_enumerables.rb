module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_count
    return self.length unless block_given?
    counter = 0
    self.my_each do |element|
      counter += 1 if yield(element)
    end
    counter
  end

  def my_each
    return to_enum(:my_each) unless block_given?
    for i in 0..(self.length - 1)
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    for i in 0..(self.length - 1)
      yield(self[i], i)
    end
    self
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    result = []
    self.my_each do |element|
      result << yield(element)
    end
    result
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    self.my_each do |element|
      result << element if yield(element)
    end
    result
  end

end
