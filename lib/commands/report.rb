module Commands
  class Report
    attr_accessor :robot

    def initialize(robot)
      @robot = robot
    end

    def execute(args = nil)
      unless @robot.placed?
        return ::Msg::UNINITIALIZED
      end
      "X: #{robot.x}, Y: #{robot.y}, F: #{robot.f}"
    end
  end
end
