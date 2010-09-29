puts "who ate my cheese?"
answer = gets
puts "I can't believe you think #{answer} ate my cheese!  Hey...why is there a new line after #{answer}?"

# try with .chomp:

puts "who ate my cheese?"
answer = gets
puts "I can't believe you think #{answer.chomp} ate my cheese!  That serves #{answer.chomp} right...I just chomped them!"