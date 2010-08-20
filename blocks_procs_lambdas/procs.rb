def formatted_print(word, format)
	format.call(word)
end



name = Proc.new do |n|
	n.capitalize!
end

first_name = "sally"
formatted_print(first_name, name)
puts first_name


address = Proc.new do |a|
  a.upcase!
end

addr = "123 Oak Street, San Francisco, CA"
formatted_print(addr, address)
puts addr