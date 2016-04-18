module Robot
  module Reporter
    class Simple < Base
      def report(navigator)
        @robot = navigator.robot

        puts "#{@robot.pos_x} #{@robot.pos_y}"
        puts @robot.total_dust
      end
    end
  end
end
