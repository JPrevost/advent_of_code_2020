data = File.open('input_day2.txt').readlines.map(&:chomp)

@valid_count = 0

def looper(line)
  rule, password = line.split(':')
  error_detector(rule, password)
end

def error_detector(rule, password)
  # puts "rule: #{rule}, password: #{password}"
  occurences, letter = rule.split(" ")
  min, max = occurences.split("-")
  if check_rule(min.to_i, max.to_i, letter, password)
    @valid_count+=1
  end
end

def check_rule(min, max, letter, password)
  # puts "min: #{min}, max: #{max}, letter: #{letter}, password: #{password}"
  matches = password.count(letter)
  if matches >= min && matches <= max
    return true
  else
    return false
  end
end

data.each do |line|
  looper(line)
end
puts @valid_count