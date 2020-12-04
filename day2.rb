data = File.open('day2_input.txt').readlines.map(&:chomp)
@valid_count = 0
def looper(line, type="range")
  rule, password = line.split(':')
  error_detector(rule, password.strip, type)
end

def error_detector(rule, password, type="range")
  # puts "rule: #{rule}, password: #{password}"
  occurences, letter = rule.split(" ")
  pos1, pos2 = occurences.split("-")
  if type == "range"
    if check_rule_range(pos1.to_i, pos2.to_i, letter, password)
      @valid_count+=1
    end
  elsif type == "position"
    if check_rule_pos(pos1.to_i-1, pos2.to_i-1, letter, password)
      @valid_count+=1
    end
  else
    puts "Unsupported error detection type"
    exit
  end
end

def check_rule_pos(pos1, pos2, letter, password)
  # puts "pos1: #{pos1}, pos2: #{pos2}, letter: #{letter}, password: #{password}"
  matches = 0
  matches +=1 if password[pos1] == letter
  matches +=1 if password[pos2] == letter

  if matches == 1
    return true
  else
    return false
  end
end

def check_rule_range(min, max, letter, password)
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
puts "Range error check valid passwords: #{@valid_count}"

@valid_count = 0
data.each do |line|
  looper(line, "position")
end
puts "Postional error check valid passwords: #{@valid_count}"
