module Robot
 class << self
    def run
      input = Input.new "./input.txt"
      map   = Map.new input.size, input.dirts
      robot = Robot.new(map, input.position)
      navigator = Navigator.new(robot)

      navigator.navigate input.drive_path

      robot.report
    end
  end
end
