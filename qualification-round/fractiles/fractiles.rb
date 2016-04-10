require 'pry'

def generate_artwork(sequence, complexity)
  orig_size = sequence.size
  orig_sequence = sequence.dup

  complexity.times do |c|
    i = 0

    while char = sequence[i]
      char = sequence[i]
      if char == 'L'
        sequence[i] = orig_sequence.dup
      else
        sequence[i] = 'G' * orig_size
      end 
      i = i + orig_size ** c + 1
    end

  end
  sequence
end

def generate_artworks(k, c)
  permutations = %w(G L).repeated_permutation(k).map &:join
  permutations.map { |seq| generate_artwork(seq, c) }
end

def fractiles(k, c, s)
  artworks = generate_artworks(k.to_i, c.to_i)
  columns = artworks.map(&:chars).transpose
  indexes = []

  l_indexes = columns.each_with_index.map { |col, j| {index: j, l_indexes: col.each_index.select { |i| col[i] == 'L' }} }
  l_indexes = l_indexes.sort_by { |indexes| indexes[:l_indexes].size }
  l_indexes.uniq[0..s.to_i-1].map {|x| x[:index] }
end

def doWork(input, output)
  num_tests = input.gets.to_i
  (1..num_tests).each do |i|
    puts i
    result = fractiles(*input.gets.split(" "))
    output.puts("Case ##{i}: #{result.join(' ')}")
  end
end

begin
  input = File.open('input.txt', 'r')
  output = File.open('output.txt', 'w')
  doWork(input, output)
rescue StandardError => error
  raise error
  input.close
  output.close
end
