data = $<.readlines.map(&:chomp)

# data.each do |l|
#   puts l.inspect
# end

rules = []
data.each do |rule|
  rules.push(rule.split(' contain '))
end

# rules.each do |r|
#   puts r.inspect
# end

@precheck = 0
@ancestors = []
def ancestor_check(color, rules)
  rules.each do |r|
    if r[1].include?(color.split(' ')[0...-1].join(' '))
      @ancestors.append(r[0].chomp)
    end
  end
end

# prime ancestors with initial target color
ancestor_check('shiny gold bag', rules)

# now check if those ancestors have ancestors until our number doesn't increase
# we need this to be recursive
def all_ancestors(rules)
  precheck = @ancestors.uniq.count
  @ancestors.each do |a|
    ancestor_check(a, rules)
  end
  return if @ancestors.uniq.count == precheck
  all_ancestors(rules)
end

all_ancestors(rules)

puts @ancestors.uniq.count

# Guesses so far: 179 is too low
# 268 is correct answer
