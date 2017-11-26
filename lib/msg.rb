class Msg
  UNINITIALIZED = 'I am not initialized'
  OUT_OF_BOUNDS = 'Out of bounds. Try another one.'
  UNDEFINED_CARDINAL = 'No such cardinal.'
  INVALID_INPUT = 'Invalid command.'
  INVALID_ARGS = 'Invalid arguments.'
  REQUIRED_ARGS = 'Arguments are required.'

  class << self

    def say(msg)
      "#{msg}"
    end

    def howto
      <<-long_desc
        Valid Commands:
        PLACE  -  Specifies position of robot in X,Y,F format.
        MOVE   -  Moves robot one unit forward in the direction it is currently facing
        LEFT   -  Rotates robot 90 degrees to the left
        RIGHT  -  Rotates robot 90 degrees to the right
        REPORT -  Shouts the current position
      long_desc
    end

    def error(msg = 'Encountered some sort of error')
      "ERROR: #{msg}".red
    end
  end
end
