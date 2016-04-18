module Robot

  class InvalidSizeError < Error; end
  class InvalidDrivePathError < Error; end
  class InvalidPositionError < Error; end

  class Input

    attr_reader :file
    attr_reader :size, :drive_path, :dirts, :position

    def initialize(file)
      @file = file

      @size = []
      @drive_path = []
      @dirts = []
      @position = []

      read
    end

    private
    def read
      lines = []
      puts file
      File.readlines(file) do |line|
        lines << line.strip
      end

      puts lines
      exit

      @size = read_size(lines.first)
      @position = read_position(lines[1])

      if drive_path_line?(lines.last)
        @drive_path = lines.lasts.split('')
      end

      lines[2..-2].each do | line|
        if pos = read_dirt_position(line)
          @dirts << pos
        end
      end

      @map = Array.new[@size[0]].map do |m|
        Array.new[@size[1]].map do |n|
          @dirts.include?([m, n])
        end
      end
    end

    def read_dirt_position(line)
      data = data.strip.split(/\s+/)
      if data.length == 2
        data
      else
        nil
      end
    end

    def read_position(data)
      data = data.strip.split(/\s+/)
      if data.length != 2
        raise InvalidPositionError , "Position needs 2 element"
      end
      data
    end

    def read_size(data)
      data = data.strip.split(/\s+/)
      if data.length != 2
        raise InvalidSizeError, "Size needs 2 element"
      end
      data
    end

    # drive_path line starts with string
    def drive_path_line?(line)
      0 == line[0]
    end
  end
end
