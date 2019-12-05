class RudolphTheRipper

  attr_reader :result
  attr_reader :count

  def initialize
    @result = true
    @count  = 0
  end

  def test(value)
    @result = true
    #puts "received #{value}"
    digits = value.chars
    digits.map! {|n| n.to_i}
    drops  = []
    pairs  = []
    i      = 0
    while i < digits.count-1 do
      if digits[i] > digits[i+1] # test the not-descending rule
        drops.push(true)
        #puts "descent"
      else
        #puts "no descent"
      end
      if digits[i] == digits[i+1]
        pairs.push(i)
        #puts "pair at #{i}"
      end
      i += 1
    end
    #puts "drops count is", drops.count
    #puts "pairs count is", pairs.count
    if drops.count > 0 or pairs.count < 1
      @result = false
    end
    #puts @result
  end

  def nastiertest(value)
    @result = true
    #puts "received #{value}"
    digits = value.chars
    digits.map! {|n| n.to_i}
    drops  = []
    neighbours = []
    pairs  = []
    i      = 0

    while i < digits.count-1 do
      if digits[i] > digits[i+1] # test the not-descending rule
        drops.push(true)
        #puts "descent"
      else
        #puts "no descent"
      end
      i += 1
    end
    i = 0 # reset i for the next loop
    while i < digits.count do
      # puts "cell #{i}"
      case true
      when i == 0 && digits[0] == digits[1]
        neighbours.push('R')
      when i == digits.count-1 && digits[digits.count-2] == digits[digits.count-1]
        neighbours.push('L')
      when digits[i] == digits[i+1] && digits[i] == digits[i-1]
        neighbours.push('B')
      when digits[i] == digits[i+1]
        neighbours.push('R')
      when digits[i] == digits[i-1]
        neighbours.push('L')
      else
        neighbours.push('N')
        #puts "cell #{i}"
      end
      i += 1
    end
    # puts neighbours
    i = 0 # reset i for the next loop
    while i < digits.count-1 do
      if neighbours[i] == 'R' && neighbours[i+1] == 'L'
        pairs.push(true)
        #puts "neighbours push"
      end
      i += 1
    end

    #puts "drops count is", drops.count
    #puts "pairs count is", pairs.count
    if drops.count > 0 or pairs.count < 1
      @result = false
    end
    #puts @result
  end

  def counter(start,finish)
    @count = 0
    i = start.to_i
    while i <= finish.to_i do
      j = i.to_s
      test(j)
      if @result == true
        @count += 1
      end
      i += 1

    end
  end

  def worktop(start,finish)
    @count = 0
    i = start.to_i
    while i <= finish.to_i do
      j = i.to_s
      nastiertest(j)
      if @result == true
        @count += 1
      end
      i += 1

    end
  end

end

rudolph = RudolphTheRipper.new
rudolph.counter(256310,732736)
puts rudolph.count

rudolph.worktop(256310,732736)
puts rudolph.count
