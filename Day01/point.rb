##
# point.rb
#
# AUTHOR::  Kyle Mullins
##

module Day01
  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def distance
      @x.abs + @y.abs
    end

    def +(other)
      Point.new(@x + other.x, @y + other.y)
    end

    def ==(other)
      @x == other.x && @y == other.y
    end

    def to_s
      "(#{@x}, #{@y})"
    end
  end
end
