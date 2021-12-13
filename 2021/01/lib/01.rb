# summary
# set up a mechanism for reading the "score" attribute
# set score to 0
# increment score by pin_count

class DepthIncreases
  # The attribute accessor lets me read the "total" value
  # https://www.rubyguides.com/2018/11/attr_accessor/
  attr_reader :total
  # "initialize" is what we PHP coders call a "constructor"
  # http://ruby-for-beginners.rubymonstas.org/writing_classes/initializers.html
  def initialize
    @total
  end
  def calculate(filename)
    # This returned an answer that was $solution-1 for the real data but correct for the test data. I remain unsure as to why.
    @total = 0
    depths = File.readlines(filename)
    puts 'There are ' + depths.length.to_s + ' array items.'
    i = 1
    # Now I want a loop over the lines 2 to $last of the file.
    # I could go from line 1 to $last-1 and test for "smaller than next" but I
    # prefer for the Ruby to match the challenge wording.
    while i < depths.length
      if depths[i-1] < depths[i]  # e.g. if depths[0] < depths[1] on first iteration
        @total +=1
      end
      i +=1
    end
  end
  def threes(filename)
    @total = 0
    depths = File.readlines(filename)
    intdepths = Array.new
    depths.each {|element| intdepths.push(element.to_i) }
    puts 'There are ' + intdepths.length.to_s + ' array items.'
    puts 'The first and last array elements are ' + intdepths[0].to_s + ' and ' + intdepths[intdepths.length-1].to_s
    i = 0
    while i < intdepths.length-3
      if intdepths.slice(i..i+2).sum < intdepths.slice(i+1..i+3).sum
        @total +=1
      end
      i +=1
    end
  end
end
