module Robot
  module Reporter

    module Color
      def self.red(text); colorize(text, "\033[31m"); end
      def self.green(text); colorize(text, "\033[32m"); end
      def self.blue(text); colorize(text, "\033[34m"); end

      private
      def self.colorize(text, color_code)
        "#{color_code}#{text}\033[0m"
      end
    end

    class Fancy < Base
      attr_reader :square
      attr_reader :navigator, :robot

      SIGN_DIRT         = "\u25A9".encode('utf-8')
      SIGN_CLEAN        = "\u25A2".encode('utf-8')
      SIGN_CLEANED_DIRT = "\u25CC".encode('utf-8')
      SIGN_ROBOT        = "🤖"
      SIGN_START        = "\u25C9".encode('utf-8')

      SIGN_MOVE_N       = "\u25B2".encode('utf-8')
      SIGN_MOVE_S       = "\u25BE".encode('utf-8')
      SIGN_MOVE_W       = "\u25C0".encode('utf-8')
      SIGN_MOVE_E       = "\u25BA".encode('utf-8')


      def report(navigator)
        @navigator = navigator
        @robot     = navigator.robot
        render
      end

      private
      def render
        square = []
        robot.map.height.downto(1) do |y|
          y = y - 1

          robot.map.width.times do |x|
            if square[x].nil?
              square[x] = Array.new(robot.map.height, SIGN_CLEAN)
            end

            if robot.pos_x == x && robot.pos_y == y
              square[x][y] = Color.blue(SIGN_ROBOT)
              print Color.blue(SIGN_ROBOT)
              print " "
              next
            end

            if robot.init_position == [x, y]
              square[x][y] = Color.blue(SIGN_START)
              print Color.blue(SIGN_START)
              print " "
              next
            end

            if history = navigator.went_in(x, y) # && !history.nil?
              case history[:direction]
              when 'n'
                print Color.blue(SIGN_MOVE_N)
              when 's'
                print Color.blue(SIGN_MOVE_S)
              when 'w'
                print Color.blue(SIGN_MOVE_W)
              when 'e'
                print Color.blue(SIGN_MOVE_E)
              end
              print " "
              next
            end

            if robot.map[x][y]
              square[x][y] = Color.blue(SIGN_DIRT)
              print Color.red(SIGN_DIRT)
              print " "
            else
              square[x][y] = Color.blue(SIGN_CLEAN)
              if robot.map.dirt?(x,y)
                print Color.red(SIGN_CLEANED_DIRT)
              else
                print Color.green(SIGN_CLEAN)
              end
              print " "
            end
          end
          puts ""
        end
      end
    end
  end
end
