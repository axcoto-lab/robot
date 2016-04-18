module Robot
  class Robot
    attr_writer :pos_x, :pos_y
    attr_reader :init_position

    def initialize(x, y)
      @init_position = [x,y]
      @pos_x = x
      @pos_y = y
    end

  end
end
