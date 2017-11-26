class Robot
  COMPASS = {
    NORTH: { y: :+ },
    EAST:  { x: :+ },
    SOUTH: { y: :- },
    WEST:  { x: :- }
  }.freeze

  attr_accessor :table, :x, :y, :f, :i

  def initialize(table)
    @table = table
    @x = nil
    @y = nil
    @f = nil
    @i = nil
  end

  def left(args = nil)
    ::Commands::Left.new(self).execute
  end

  def right(args = nil)
    ::Commands::Right.new(self).execute(args)
  end

  def report(args = nil)
    ::Commands::Report.new(self).execute(args)
  end

  def move(args = nil)
    ::Commands::Move.new(self).execute(args)
  end

  def place(args = nil)
    ::Commands::Place.new(self).execute(args)
  end

  def placed?
    !(x.nil? || y.nil?|| f.nil? || i.nil?)
  end

  def out_of_bounds?(value)
    value < 0 || value > table.length - 1 || value > table.width - 1
  end
end
