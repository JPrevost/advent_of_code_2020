report = File.open("day1_input.txt").readlines.map{|line| line.chomp.to_i}

def expense_report(input, addends=3, target=2020)
  input.permutation(addends).each do |p|
    if p.reduce(:+) == target
      return p.reduce(:*)
    end
  end
end

puts expense_report(report, 2)
puts expense_report(report, 3)