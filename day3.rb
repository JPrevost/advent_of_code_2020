data = File.open('day3_input.txt').readlines.map(&:chomp)

def tree_counter(slope, data)
  trees = 0
  start = [0, 0]
  current = start

  data.each do |line|
    current = [(current[0] + slope[0]), (current[1] + slope[1])]
    x = current[0] % line.length
    y = current[1]

    next unless data[y]

    trees += 1 if data[y][x] == '#'
  end
  trees
end

slope = [3, 1]
puts "Trees on sample path: #{tree_counter(slope, data)}"

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
total = 1
slopes.each do |slope|
  total *= tree_counter(slope, data)
end

puts "Mutliplied Trees on all calculated paths: #{total}"
