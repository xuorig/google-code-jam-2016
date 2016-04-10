require 'prime'

def starts_and_ends_with_one(bin_num)
  bin_num[0] == "1" && bin_num[-1] == "1"
end

def find_divisors(bin_num)
  divisors = []

  (2..10).each do |base|
    converted = bin_num.to_i(base)
    i = 2

    if converted % 2
      jump = 2
      i = 3
    else
      jump = 1
    end
    
    divisor = nil

    while i ** 2 < converted
      divisor = i if converted % i == 0
      break if divisor
      i += jump
    end

    return unless divisor
    divisors << divisor
  end

  divisors
end

out = File.open('output_file2.txt', 'w')

N = 32
J = 500

found = 0
num = '1000000000000000'

out.puts("Case #1:") 

while found < J
  num = (num.to_i(2) + 1).to_s(2)
  next unless starts_and_ends_with_one(num)

  divisors = find_divisors(num)
  if divisors
    out.puts("#{num} #{divisors.join(' ')}")
    found += 1
  end
end




