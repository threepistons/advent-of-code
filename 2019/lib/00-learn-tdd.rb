# summary
# set up a mechanism for reading the "score" attribute
# set score to 0
# increment score by pin_count

class Bowling
  # The attribute accessor lets me read the score value
  # https://www.rubyguides.com/2018/11/attr_accessor/
  attr_reader :score
  # "initialize" is what we PHP coders call a "constructor"
  # http://ruby-for-beginners.rubymonstas.org/writing_classes/initializers.html
  def initialize
    @score = 0
  end
  def hit(pin_count)
    @score += pin_count
  end
end

class Trombone

  attr_reader :length

  def initialize
    @firstlength = 270.0
  end

  def slide(position)
    reallength = @firstlength * (2.0 ** ((position - 1.0) / 12.0))
    @length = reallength.to_i
    puts position
    puts @length
  end

end
