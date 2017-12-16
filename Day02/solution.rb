# frozen_string_literal: true

##
# solution.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'point'

module Day02
  class Part1
    def process_input(input_lines)
      input_lines
    end

    def solve(input)
      keypad = (1..9).map(&:to_s).each_slice(3).to_a
      cur_pos = Point.new(1, 1)
      direction_hash = { 'U' => Point.new(-1, 0), 'R' => Point.new(0, 1),
                         'D' => Point.new(1, 0), 'L' => Point.new(0, -1) }
      code = ''

      input.each do |instructions|
        instructions.chars.each do |direction|
          new_pos = cur_pos + direction_hash[direction]
          cur_pos = new_pos.in_bounds?(0, 2) ? new_pos : cur_pos
        end

        code += keypad[cur_pos.x][cur_pos.y]
      end

      code
    end
  end

  class Part2
    def process_input(input_lines)
      input_lines
    end

    def solve(input)
      keypad = [%w[0 0 1 0 0], %w[0 2 3 4 0], %w[5 6 7 8 9],
                %w[0 A B C 0], %w[0 0 D 0 0]]
      cur_pos = Point.new(2, 0)
      direction_hash = { 'U' => Point.new(-1, 0), 'R' => Point.new(0, 1),
                         'D' => Point.new(1, 0), 'L' => Point.new(0, -1) }
      code = ''

      input.each do |instructions|
        instructions.chars.each do |direction|
          new_pos = cur_pos + direction_hash[direction]
          cur_pos = in_bounds?(new_pos) ? new_pos : cur_pos
        end

        code += keypad[cur_pos.x][cur_pos.y]
      end

      code
    end

    def in_bounds?(point)
      return false unless point.in_bounds?(0, 4)

      case point.x
      when 0, 4
        point.y == 2
      when 1, 3
        point.y.between?(1, 3)
      when 2
        point.y.between?(0, 4)
      else
        false
      end
    end
  end
end
