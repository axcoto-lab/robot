module Robot
  class Robot
    attr_accessor :pos_x, :pos_y
    attr_reader :init_position
    attr_reader :total_dust
    attr_reader :map

    def initialize(map, pos)
      @init_position = pos
      @pos_x = pos[0]
      @pos_y = pos[1]
      @map = map

      @total_dust = 0

      # Inital cleanup if robot is sit right in place has dirt
      work
    end

    def move(direction)
      case direction.downcase
      when 'n'
        if pos_y < (map.height - 1)
          @pos_y += 1
        end
      when 's'
        if pos_y > 0
          @pos_y -= 1 
        end
      when 'e'
        if pos_x < (map.width - 1)
          @pos_x += 1 
        end
      when 'w'
        if pos_x > 0
          @pos_x -= 1 
        end
      end

      work
    end

    def work
      if map[pos_x][pos_y]
        @total_dust += 1
        map[pos_x][pos_y] = false # we clean it
      end
    end

    # Report robot statistic
    def report
      puts "#{pos_x} #{pos_y}"

      puts total_dust
    end
  end
end
