answers = $<.readlines.map(&:chomp)

groups = []
group = 0

answers.each do |a|
  if a == ""
    group += 1
    next
  end

  if groups[group]
    groups[group].push(a)
  else
    groups[group] = [a]
  end
end

total = 0

groups.each do |g|
  total = total + g.flatten.join.split('').uniq.count
end

p "Part one: #{total}"

modified_total = 0

groups.each do |g|
  members = g.length
  counts = Hash.new(0)
  g.flatten.join.split('').each do |q|
    counts[q] += 1
  end
  counts.delete_if {|key, value| value < members }
  modified_total = modified_total += counts.length
end

p "Part two: #{modified_total}"
