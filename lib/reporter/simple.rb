module Robot
  module Reporter
    class Simple < Base
      def report
        puts "#{@robot.pos_x} #{@robot.pos_y}"
        puts @robot.total_dust
      end
    end
  end
end
