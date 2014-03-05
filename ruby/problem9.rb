require 'matrix'
require 'benchmark'
time = Benchmark.realtime do
  VALUE_BEING_SEARCHED = 1000

  # http://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples
  A = Matrix[
              [1, -2, 2],
              [2, -1, 2],
              [2, -2, 3]
            ]
  C = Matrix[
              [-1, 2, 2],
              [-2, 1, 2],
              [-2, 2, 3]
            ]
  B = Matrix[
              [1, 2, 2],
              [2, 1, 2],
              [2, 2, 3]
            ]

  def cascade_primitive_triplets(root, matrix)
    sum_abc = root[0,0] + root[1,0] + root[2, 0]
    if(sum_abc == VALUE_BEING_SEARCHED or VALUE_BEING_SEARCHED % sum_abc == 0)
      if(sum_abc != VALUE_BEING_SEARCHED)
        scale_factor = VALUE_BEING_SEARCHED / sum_abc
        root = root.map {|num| num * scale_factor}
      end
      return root
    elsif(sum_abc < VALUE_BEING_SEARCHED)
      next_root = matrix * root
      return traverse_each_matrix(next_root)
    else
      return false
    end
  end

  def traverse_each_matrix(root)

    value = cascade_primitive_triplets(root, A)
    value = value ? value : cascade_primitive_triplets(root, C)
    value = value ? value : cascade_primitive_triplets(root, B)

    return value
  end

  # The smallest primitive triple
  root = Matrix[[3],
                [4],
                [5]]

  @result = traverse_each_matrix(root)
end

if @result
  puts "A: #{@result[0,0]}, B: #{@result[1,0]}, C: #{@result[2,0]}"
  puts "product: #{@result[0,0]*@result[1,0]*@result[2,0]}"
  puts "Time elapsed #{time*1000} milliseconds"
else
  puts "You can only search for sums which can be factored into a pythagorean triple."
end