module Robot

  class Navigator
    attr_reader :robot, :map

    def initialize(robot)
      @robot = robot
      @map   = robot.map
    end

    def navigate(instruction)
      instruction.each do |direction|
        robot.move direction
      end
    end

  end
end
