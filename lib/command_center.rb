class CommandCenter
  VALID = %w(left right move place report).freeze

  attr_reader :robot, :command_input
  def initialize(robot)
    @robot = robot
  end

  def analyze(command_input = nil)
    return if command_input.nil?
    command_input, args = command_input.chomp.split(' ')
    command_input = "#{command_input}".downcase

    unless VALID.include?(command_input)
      return ::Msg::INVALID_COMMAND
    end

    @robot.send(:"#{command_input}", args)
  end
end
