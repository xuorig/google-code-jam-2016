def flip(pancakes, at)
  (0..at).each do |i|
    if pancakes[i] == "+"
      pancakes[i] = "-"
    else
      pancakes[i] = "+"
    end
  end 
end

def flip_number(pancakes, case_num, out)
  flips = 0

  (0..pancakes.size-1).reverse_each do |i|
    if pancakes[i] == "-"
      flip(pancakes, i)
      flips += 1
    end
  end

  out.puts("Case ##{case_num}: #{flips}")
end

infile = File.open('input.txt', 'r')
out = File.open('output.txt', 'w')

num_tests = infile.gets.to_i
(1..num_tests).each { |i| flip_number(infile.gets.chomp, i, out) }
