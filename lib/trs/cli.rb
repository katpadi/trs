require "thor"
require "trs"

module Trs
  class CLI < Thor
    desc 'output [PATH TO FILE]', 'Analyze and print out the final position of robot from a series of commands from a file'
    method_option :length, type: :numeric, default: 5, aliases: "-l"
    method_option :width,  type: :numeric, default: 5, aliases: "-w"
    def output(file_name)
      contents = File.read(file_name)
      line_num = 0
      contents.gsub!(/\r\n?/, "\n")

      table = Table.new(options[:length], options[:width])
      robot = Robot.new(table)
      command_ctr = CommandCenter.new(robot)

      contents.each_line do |text|
        puts "COMMAND ##{line_num += 1}: #{text}"
        puts command_ctr.analyze(text)
      end
      puts robot.report
    end

    desc 'play', 'Interactive client that analyzes and prints out the position of robot'
    method_option :length, type: :numeric, default: 5, aliases: "-l", desc: 'Length of table'
    method_option :width,  type: :numeric, default: 5, aliases: "-w", desc: 'Width of table'
    method_option :auto_report,  type: :boolean, default: false, aliases: "-r", desc: 'Auto-reports after every command if set to true'
    def play
      say welcome_greeting, :yellow
      table = Table.new(options[:length], options[:width])
      robot = Robot.new(table)
      command_ctr = CommandCenter.new(robot)
      loop do
        say 'Input command (BYE to quit): '
        input = STDIN.gets
        if input =~ /bye/i
          break
        else
          puts command_ctr.analyze(input)
          puts robot.report if options[:auto_report]
        end
      end
    end

    no_commands do
      def welcome_greeting
        <<-long_desc
          WELCOME TO TOY ROBOT SIMULATION!

          Valid Commands:
          PLACE  -  Specifies position of robot in X,Y,F format.
                    i.e.  : PLACE 1,1,SOUTH
          MOVE   -  Moves robot X unit forward in the direction it is currently facing
                    i.e.  : MOVE or MOVE 2
          LEFT   -  Rotates robot 90 degrees to the left
          RIGHT  -  Rotates robot 90 degrees to the right
          REPORT -  Shouts the current position
        long_desc
      end
    end
  end
end
