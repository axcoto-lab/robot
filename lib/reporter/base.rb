module Robot
  module Reporter
    class Base
      def initialize(robot)
        @robot = robot
      end

      def report
        raise "Method report is not implemented"
      end
    end
  end
end
