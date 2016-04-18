module Robot

  class Navigator
    attr_reader :robot, :map

    def initialize(robot, map)
      @robot = robot
      @map   = map
    end

    def navigate(instruction)
    end

    private
    def move(direction)
      case direction.dowcase
        when 'n'
          move_n
        when 's'
          move_s
        when 'e'
          move_e
        when 'w'
          move_w
      end
    end

    def move_n
    end

    def move_s

    end

    def move_w

    end

    def move_s

    end
  end
end
