class Power
  attr_reader :gamma
  attr_reader :epsilon
  attr_reader :product
  def initialize(filename)
    @file = File.new(filename)
  end
  def calculate
    binaries = Array.new
    rawgamma = String.new
    rawepsilon = String.new
    @file.each_line($/, chomp: true) do |line| # The chomp keeps the line ends out of the array.
      # lines 000 and 111 become a nested array [[0,0,0],[1,1,1]]
      binaries << line.chars # this double arrow means "append"
    end
    workingcopy = binaries.transpose # array is now [[0,1],[0,1][0,1]]
    workingcopy.each do |column| # column is a flat array
      if column.count.to_f/2 < column.count('1') # not the same as column.count(1) because integers are not strings
        rawgamma.concat('1')
        rawepsilon.concat('0')
      else
        rawgamma.concat('0')
        rawepsilon.concat('1')
      end
    end
    @gamma = rawgamma.to_i(2)
    @epsilon = rawepsilon.to_i(2)
    @product = @gamma * @epsilon
  end
end
