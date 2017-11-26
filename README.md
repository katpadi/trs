# TRS

This is an implementation of the Toy Robot Simulator.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trs

## Usage

##### Interactive Mode
Run by runtime command input:
```sh
  trs play
```
Options:
  -l, [--length=N] # Default: 5
  -w, [--width=N] # Default: 5

##### Output Mode
Run by scanning a file:
```shell
  trs output [PATH TO FILE]
```
Options:
  -l, [--length=N]  # Default: 5
  -w, [--width=N]   # Default: 5

## Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

Create an application that can read in commands of the following form

PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

## Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

## Example Input and Output

a)
    PLACE 0,0,NORTH
    MOVE
    REPORT
    Output: 0,1,NORTH

b)
    PLACE 0,0,NORTH
    LEFT
    REPORT
    Output: 0,0,WEST

c)
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    Output: 3,3,NORTH



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trs.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

