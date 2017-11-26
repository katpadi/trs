module Commands
  class Place

    attr_accessor :robot, :args
    def initialize(robot)
      @robot = robot
    end

    def execute(args = nil)
      if args.nil? || args.split(',').count != 3
        return ::Msg.error(::Msg::INVALID_ARGS)
      end

      x_pos, y_pos, cardinal_dir = parse(args)

      unless valid_cardinal?(cardinal_dir)
        return ::Msg.error(::Msg::UNDEFINED_CARDINAL)
      end

      unless valid_position?(x_pos, y_pos)
        return ::Msg.error(::Msg::OUT_OF_BOUNDS)
      end

      @robot.x = x_pos
      @robot.y = y_pos
      @robot.i = Robot::COMPASS.keys.index(cardinal_dir)
      @robot.f = cardinal_dir
      @robot.report
    end

    private

    def valid_cardinal?(cardinal_dir)
      Robot::COMPASS.keys.include?(cardinal_dir.upcase)
    end

    def valid_position?(x_pos, y_pos)
      !robot.out_of_bounds?(x_pos) && !robot.out_of_bounds?(y_pos)
    end

    def parse(args)
      x_pos, y_pos, cardinal_dir = args.split(',')
      [x_pos.to_i, y_pos.to_i, :"#{cardinal_dir}".upcase]
    end
  end
end
