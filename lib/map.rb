module Robot

  class Map
    attr_reader :map, :dirt_map
    attr_reader :width, :height

    def initialize(size, dirt_map)
      @dirt_map = dirt_map
      @width = size[0]
      @height = size[1]

      @map = Array.new(width, false).each_with_index.map do |_, m|
        Array.new(height, false).each_with_index.map do |_, n|
          dirt?(m,n)
        end
      end
    end

    def out_of_bound?(x,y)
      x < 0 || y < 0 || x >= width || y >= height
    end

    def dirt?(x, y)
      @dirt_map.include?([x, y])
    end

    def [](key)
      @map[key]
    end
  end
end
