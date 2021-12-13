class Trajectory
  # The attribute accessor lets me read the "total" value
  # https://www.rubyguides.com/2018/11/attr_accessor/
  attr_reader :length
  attr_reader :depth
  attr_reader :product
  # "initialize" is what we PHP coders call a "constructor"
  # http://ruby-for-beginners.rubymonstas.org/writing_classes/initializers.html
  def initialize
    # Do I need to do anything here? Manual says that "attr_reader" creates instance variables
  end
  def calculate(filename)
    vectors = File.readlines(filename)
    @length = 0
    @depth = 0
    # a loop over vectors
    vectors.each do |vector|
      # a set of case statements to apply vector to length or depth
      # The vector is a string composed of "direction digits" where "direction" is ['up','down','forward']
      components = vector.split(' ') # should be ['up',2]
      case components[0] # lets me use regex
      when 'forward'
        @length += components[1].to_i
      when 'up'
        @depth -= components[1].to_i
      when 'down'
        @depth += components[1].to_i
      end
    end
    @product = @length * @depth
  end
end
