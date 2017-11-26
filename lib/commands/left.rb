module Commands
  class Left
    attr_accessor :robot

    def initialize(robot)
      @robot = robot
    end

    def execute(args = nil)
      unless @robot.placed?
        return ::Msg.error(::Msg::UNINITIALIZED)
      end

      @robot.i = (@robot.i - 1) % Robot::COMPASS.size
      @robot.f = ::Robot::COMPASS.keys[@robot.i]
      @robot.report
    end
  end
end

