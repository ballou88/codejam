
def log_base(a,b)
  return (Math.log(a)/Math.log(b)).floor
end

def convert_to_base10(number, source)
  value = 0
  number.each_with_index do |val, i| 
    value += source.index(val) * (source.length)**(number.length - i-1)
  end
  value
end

def convert_to_arbitrary_base(value, target)
  a_len = log_base(value, target.length)
  answer = Array.new
  a_len.downto(0).each do |val|
    max = (value/(target.length**val)).floor
    #p "max is #{max}"
    #p "#{value} - #{target.length**val} = #{value - target.length**val}"
    (value >= target.length**val) ? (value -= max*(target.length**val)) : value
    answer[val] = target[max]
  end
  return answer.reverse.join
end

File.open("test.txt", "r") do |file|
  cases = file.gets.to_i
  cases.times.with_index do |index, num| 
    words = file.gets.chomp.split
    #next if index != 3
    number = words[0].split(//)
    source = words[1].split(//)
    target = words[2].split(//)

    value = convert_to_base10(number, source)
    target_value = convert_to_arbitrary_base(value, target)
    puts "Case ##{index+1}: #{target_value}"
  end
end