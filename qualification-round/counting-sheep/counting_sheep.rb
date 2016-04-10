require 'set'
require 'prime'

out = File.open('output_file.txt', 'w')
infile = File.open('input_file.txt', 'r')

def countSheep(num, i, out)
  if num == 0
    out.puts("Case ##{i}: INSOMNIA") 
    return
  end

  seen = Set.new
  j = 1

  while seen.size < 10
    new_num = num * j 
    new_num.to_s.each_char do |digit|
      seen.add(digit)
    end
    j += 1
  end

  out.puts("Case ##{i}: #{new_num}")
end

numberOfTests = infile.gets.to_i

(1..numberOfTests).each do |i|
  num = infile.gets.to_i
  countSheep(num, i, out) 
end
