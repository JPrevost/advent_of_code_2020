@data = $<.readlines.map(&:chomp)

@accumultor = 0
pointer = 0
@visited = []

def boot(pointer)
  puts "pointer: #{pointer}"
  puts "accumulator: #{@accumulator}"
  puts "instruction: #{@data[pointer]}"
  type, amount = @data[pointer].split(' ')
  puts type
  puts amount
  if type == "nop"
    pointer +=1
  elsif type == "acc"
    if amount[0] == "+"
      @accumultor += amount[1..-1].to_i
      pointer +=1
    else
      @accumultor -= amount[1..-1].to_i
      pointer +=1
    end
  elsif type == "jmp"
    if amount[0] == "+"
      pointer += amount[1..-1].to_i
    elsif amount[0] == "-"
      pointer -= amount[1..-1].to_i
    end
  end
  if @visited.include?(pointer)
      puts "The End!: Accumulator: #{@accumultor}"
      exit
  else
    @visited.push(pointer)
    puts @visited.inspect
    boot(pointer)
  end
end

boot(pointer)