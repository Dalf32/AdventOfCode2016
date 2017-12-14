##
# solution.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'point'

module Day01
  class Part1
    def process_input(input_lines)
      input_lines.first.split(', ').map { |instr| [instr[0], instr[1..-1].to_i] }
    end

    def solve(input)
      # Start facing North, then going clockwise
      move_matrix = [Point.new(0, 1), Point.new(1, 0),
                     Point.new(0, -1), Point.new(-1, 0)]
      cur_facing = 0
      cur_location = Point.new(0, 0)

      input.each do |instr|
        increment = instr.first == 'L' ? -1 : 1
        cur_facing = (cur_facing + increment + 4) % 4

        instr.last.times { cur_location += move_matrix[cur_facing] }
      end

      cur_location.distance
    end
  end

  class Part2
    def process_input(input_lines)
      input_lines.first.split(', ').map { |instr| [instr[0], instr[1..-1].to_i] }
    end

    def solve(input)
      # Start facing North, then going clockwise
      move_matrix = [Point.new(0, 1), Point.new(1, 0),
                     Point.new(0, -1), Point.new(-1, 0)]
      cur_facing = 0
      cur_location = Point.new(0, 0)
      visited_locations = [cur_location]

      input.each do |instr|
        increment = instr.first == 'L' ? -1 : 1
        cur_facing = (cur_facing + increment + 4) % 4

        instr.last.times do
          cur_location += move_matrix[cur_facing]
          return cur_location.distance if visited_locations.include?(cur_location)
          visited_locations << cur_location
        end
      end

      cur_location.distance
    end
  end
end
