require_relative 'reporter/base'
require_relative 'reporter/simple'
require_relative 'reporter/fancy'

module Robot
  class Robot
    attr_accessor :pos_x, :pos_y
    attr_reader :init_position
    attr_reader :total_dust
    attr_reader :map
    attr_reader :step

    def initialize(map, pos)
      @init_position = pos
      @pos_x = pos[0]
      @pos_y = pos[1]
      @map = map

      @total_dust = 0

      # setup step function
      @step = {
        n: -> { @pos_y += 1 if !map.out_of_bound?(@pos_x, @pos_y + 1) },
        s: -> { @pos_y -= 1 if !map.out_of_bound?(@pos_x, @pos_y - 1) },
        e: -> { @pos_x += 1 if !map.out_of_bound?(@pos_x + 1, @pos_y) },
        w: -> { @pos_x -= 1 if !map.out_of_bound?(@pos_x - 1, @pos_y) },
      }

      # Inital cleanup if robot is sit right in place has dirt
      work
    end

    def move(direction)
      step[direction.downcase.to_sym].call
      work
    end

    def work
      if map[pos_x][pos_y]
        @total_dust += 1
        map[pos_x][pos_y] = false # we clean it
      end
    end

    # Report robot statistic
    def report(navigator)
      if ARGV[1] == 'fancy'
        @reporter ||= Reporter::Fancy.new
      else
        @reporter ||= Reporter::Simple.new
      end
      @reporter.report navigator
    end

    def pos
      [pos_x, pos_y]
    end
  end
end
