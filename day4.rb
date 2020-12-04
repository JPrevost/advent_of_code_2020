data = File.open('day4_input.txt')

passports = []
passport = 0

data.each_line do |line|
  if line.chomp == ""
    passport +=1
    next
  else
    if passports[passport]
      passports[passport] += " #{line.chomp}"
    else
      passports[passport] = line.chomp
    end
  end
end

def required
  ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
end

def check_passport(data)
  fields =  data.split(' ')
  h = Hash[fields.map {|el| el.split ':'}]

  required.each do |r|
    # puts "Does #{h.keys.inspect} include #{r}"
    if h.keys.include?(r)
      # puts "valid"
      if r == 'byr'
        # byr (Birth Year) - four digits; at least 1920 and at most 2002.
        # puts h['byr'] if ('1920'..'2002').include?(h['byr'])
        return 'invalid' unless ('1920'..'2002').include?(h['byr'])
      elsif r == 'iyr'
        # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
        # puts h['iyr'] if ('2010'..'2020').include?(h['iyr'])
        return 'invalid' unless ('2010'..'2020').include?(h['iyr'])
      elsif r == 'eyr'
        # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
        # puts h['eyr'] if ('2020'..'2030').include?(h['eyr'])
        return 'invalid' unless ('2020'..'2030').include?(h['eyr'])
      elsif r == 'hgt'
        # (Height) - a number followed by either cm or in:
          # If cm, the number must be at least 150 and at most 193.
          # If in, the number must be at least 59 and at most 76.
        # puts h['hgt']
        if h['hgt'].end_with?('cm')
          # puts h['hgt'].delete_suffix('cm')
          # puts h['hgt'].delete_suffix('cm') if ('150'..'193').include?(h['hgt'].delete_suffix('cm'))
          return 'invalid' unless ('150'..'193').include?(h['hgt'].delete_suffix('cm'))
        elsif h['hgt'].end_with?('in')
          # puts h['hgt'].delete_suffix('in') if ('59'..'76').include?(h['hgt'].delete_suffix('in'))
          return 'invalid' unless ('59'..'76').include?(h['hgt'].delete_suffix('in'))
        else
          # puts h['hgt']
          return 'invalid'
        end
      elsif r == 'hcl'
        # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f
        # puts /\#{1}[[:xdigit:]]{6}/.match(h['hcl']) if /\#{1}[[:xdigit:]]{6}/.match(h['hcl'])
        # puts h['hcl'] unless /\#{1}[[:xdigit:]]{6}/.match(h['hcl'])
        return 'invalid' unless /\#{1}[[:xdigit:]]{6}/.match(h['hcl'])
      elsif r == 'ecl'
        # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth
        # puts h['ecl'] unless %w(amb blu brn gry grn hzl oth).include?(h['ecl'])
        return 'invalid' unless %w(amb blu brn gry grn hzl oth).include?(h['ecl'])
      elsif r == 'pid'
        # pid (Passport ID) - a nine-digit number, including leading zeroes
        # puts /[[:digit:]]{9}/.match(h['pid']) if /[[:digit:]]{9}/.match(h['pid'])
        # puts h['pid'] if /[[:digit:]]{9}/.match(h['pid'])
        return 'invalid' unless h['pid'].length == 9
        return 'invalid' unless /[[:digit:]]{9}/.match(h['pid'])
      end
    else
      # puts "invalid #{r} not in #{h.keys}"
      return "invalid"
    end
  end
end

valid_passports = 0
passports.each do |p|
  status = check_passport(p)
  if status != "invalid"
    valid_passports +=1
  else
    # puts "passport #{p}. Status #{status}."
  end
end

puts "#{valid_passports} valid passports"
