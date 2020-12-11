data = $<.readlines.map(&:chomp)

# puts data.inspect

#In this example, after the 5-number preamble, almost every number is the sum of two of the previous 5 numbers; the only number that does not follow this rule is 127.

def invalid_number(preamble, previous, data)
  data[preamble..].each do |x|
    sums = []
    previous.permutation(2).each do |y|
      # p y.inspect
      sums.push(y[0].to_i + y[1].to_i)
    end
    # p sums
    if sums.include?(x.to_i)
      previous.shift
      previous.push(x)
      next
    end
    return x
  end
end

preamble = 25
previous = []
previous.push(data[0...preamble]).flatten!

target = invalid_number(preamble, previous, data)
# puts target

def brute_force(size, data, target)
  puts "Starting brute force with size #{size} and target #{target}"
  start = 0
  stop = start + size
  while stop <= data.size
    # puts data[start...stop].inspect
    # puts data[start...stop].map{|x| x.to_i }.sum
    if data[start...stop].map{|x| x.to_i }.sum == target.to_i
      set = data[start...stop].map{|x| x.to_i }
      puts set.min + set.max
      exit
    else
      start += 1
      stop += 1
    end
  end
  brute_force(size+1, data, target)
end

brute_force(2, data, target)