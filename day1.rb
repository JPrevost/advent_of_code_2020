report = File.open("input_day1.txt").readlines.map(&:chomp)

def expense_checker(expense_report, addends)

  expense_report.each_with_index do |val,index|

    expense_report.each_with_index do |val2, index2|
      
      expense_report.each_with_index do |val3, index3|
        if val == val2 || val2 == val3 || val3 == val
          # puts "same; skip"
          next
        else
          if addends == 3
            if (val.to_i + val2.to_i + val3.to_i) == 2020
              puts "bingo: #{val} + #{val2} + #{val3}= #{val.to_i + val2.to_i + val3.to_i}"
              puts "answer: #{val.to_i * val2.to_i * val3.to_i}"
              exit
            else
              # puts "nope: #{val} + #{val2} = #{val.to_i + val2.to_i}"
              next
            end
          elsif addends == 2
            if (val.to_i + val2.to_i) == 2020
              puts "bingo: #{val} + #{val2} = #{val.to_i + val2.to_i }"
              puts "answer: #{val.to_i * val2.to_i}"
              exit
          else
            # puts "nope: #{val} + #{val2} = #{val.to_i + val2.to_i}"
            next
            end
          else
            puts "unsupported number of addends"
            return
          end
        end
      end
    end
  end
end

expense_checker(report, 3)