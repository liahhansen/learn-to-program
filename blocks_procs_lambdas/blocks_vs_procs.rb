class Array
  def iterate_with_block!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end

  def iterate_with_proc!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end


### With a block
nums = [2, 3, 4, 5]
nums.iterate_with_block! { |num| num ** 2 }
puts nums.inspect

# => [4, 9, 16, 25]



### With a proc
square = Proc.new do |n|
  n ** 2
end
nums = [2, 3, 4, 5]
nums.iterate_with_proc!(square)

puts nums.inspect

# => [4, 9, 16, 25]

