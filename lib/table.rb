# Sample 5x5:
#
# 04  14  24  34  44
# 03  13  23  33  43
# 02  12  22  32  42
# 01  11  21  31  41
# 00  10  20  30  40
class Table
  attr_reader :length, :width
  def initialize(length, width)
    @length = length
    @width = width
  end
end
