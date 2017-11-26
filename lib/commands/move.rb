module Commands
  class Move
    DEFAULT_STEP = 1

    attr_accessor :robot

    def initialize(robot)
      @robot = robot
    end

    def execute(args = nil)
      unless @robot.placed?
        return ::Msg::UNINITIALIZED
      end

      axis = Robot::COMPASS[@robot.f].keys[0]
      object_msg = Robot::COMPASS[@robot.f][axis]
      step = args.to_i > 0 ? args.to_i : DEFAULT_STEP
      axis_value = @robot.send(axis).send(object_msg, step)
      if @robot.out_of_bounds?(axis_value)
        return ::Msg::OUT_OF_BOUNDS
      end
      @robot.send("#{axis}=", axis_value)
      ::Msg::OK
    end
  end
end
