module Commands
  class Report
    attr_accessor :robot

    def initialize(robot)
      @robot = robot
    end

    def execute(args = nil)
      if @robot.uninitialized?
        return ::Msg.error(::Msg::UNINITIALIZED)
      end
      ::Msg.say "X: #{robot.x}, Y: #{robot.y}, F: #{robot.f}"
    end
  end
end