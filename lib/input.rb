module Robot

  class InvalidFileError < Error; end
  class InvalidSizeError < Error; end
  class InvalidDrivePathError < Error; end
  class InvalidPositionError < Error; end

  class Input

    attr_reader :file
    attr_reader :size, :drive_path, :dirts, :position

    def initialize(file = 'input.txt')
      file = 'input.txt' if file.nil?
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
      begin
        File.open(file, 'r') do |f|
          lines = f.each_line.map { |l| l.strip }
          f.close
        end
      rescue
        raise InvalidFileError, "Error read file #{file}"
      end

      @size = read_size(lines.first)

      @position = read_position(lines[1])

      if drive_path_line?(lines.last)
        @drive_path = lines.last.split('')
      end

      lines[2..-2].each do | line|
        if pos = read_dirt_position(line)
          @dirts << pos
        end
      end
    end

    def read_dirt_position(data)
      data = data.strip.split(/\s+/)
      if data.length == 2
        data.map(&:to_i)
      else
        nil
      end
    end

    def read_position(data)
      data = data.strip.split(/\s+/)
      if data.length != 2
        raise InvalidPositionError , "Position needs 2 element"
      end
      data.map(&:to_i)
    end

    def read_size(data)
      data = data.strip.split(/\s+/)
      if data.length != 2
        raise InvalidSizeError, "Size needs 2 element"
      end
      data.map(&:to_i)
    end

    # drive_path line starts with string
    def drive_path_line?(line)
      0 == line[0].to_i
    end
  end
end
