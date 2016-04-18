module Robot
  class Error < RuntimeError; end
end

require_relative 'lib/input.rb'
require_relative 'lib/robot.rb'
require_relative 'lib/runner.rb'
require_relative 'lib/map.rb'
require_relative 'lib/navigator.rb'

if $PROGRAM_NAME.split('/').last == 'robot.rb'
  Robot.run
end

