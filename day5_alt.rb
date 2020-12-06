# Slightly modified from https://www.reddit.com/r/adventofcode/comments/k71h6r/2020_day_05_solutions/gep808u?utm_source=share&utm_medium=web2x&context=3
seats = $<.readlines.map { |l| l.tr!('BFRL', '1010').to_i(2) }
p "Max: #{seats.max}"
p "My seat: #{seats.select { |l| !seats.include?(l + 1) }.min + 1}"
