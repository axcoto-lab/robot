module Robot

  class Navigator
    attr_reader :robot, :map
    attr_reader :trait

    def initialize(robot)
      @robot = robot
      @map   = robot.map
      @trait  = []
    end

    def navigate(instruction)
      instruction.each do |direction|
        robot.move direction.downcase
        @trait << {pos: robot.pos, direction: direction.downcase}
      end
    end

    def went_in(x, y)
      trait.select do |history|
        history[:pos] == [x, y]
      end.last
    end

  end
end
