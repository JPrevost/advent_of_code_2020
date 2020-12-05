data = File.open('day5_input.txt').readlines.map(&:chomp)

def sorter(row_code, rows)
  row_code.each do |l|
    new_length = rows.length / 2
    if l == "F" || l == "L"
      rows = rows[0..new_length-1]
    elsif l == "B" || l == "R"
      rows = rows.reverse[0..new_length-1].reverse
    end
  end
  return rows[0]
end

def seat_finder(code)
  row_code = code[0..6].split('')
  col_code = code[7..9].split('')
  rows = Array(0..127)
  cols = Array(0..7)
  
  # puts row_code.inspect
  row = sorter(row_code, rows)
  
  # puts col_code.inspect
  col = sorter(col_code, cols)

  row * 8 + col
end

seat_ids = []
data.each do |seat|
  seat_ids.append(seat_finder(seat))
end
puts "Highest seat ID: #{seat_ids.max}"

sorted_ids = seat_ids.sort

possibles = []
sorted_ids.each_with_index do |id, index|
  # puts "ID: #{id} previous #{sorted_ids[index-1]}"
  # puts id unless sorted_ids[index-1] == id-1 && sorted_ids[index+1] == id+1
  possibles.append(id) unless sorted_ids[index-1] == id-1 && sorted_ids[index+1] == id+1
end

neighbors = possibles.drop(1).reverse.drop(1).reverse
puts "My seat: #{neighbors.sum / neighbors.size}"
