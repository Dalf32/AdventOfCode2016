##
# solution.rb
#
# AUTHOR::  Kyle Mullins
##

module Day03
  class Part1
    def process_input(input_lines)
      input_lines.map { |spec| spec.split.map(&:to_i) }
    end

    def solve(input)
      input.select { |sides| Day03.valid_triangle?(sides) }.count
    end
  end

  class Part2
    def process_input(input_lines)
      input_lines.map { |spec| spec.split.map(&:to_i) }
    end

    def solve(input)
      triangles = input.each_slice(3).reduce([]) do |triangle_list, trio|
        triangle_list + trio[0].zip(trio[1]).zip(trio[2]).map(&:flatten)
      end

      triangles.select { |sides| Day03.valid_triangle?(sides) }.count
    end
  end

  def self.valid_triangle?(sides)
    longest_side = sides.max
    other_sides_sum = sides.reduce(&:+) - longest_side
    other_sides_sum > longest_side
  end
end