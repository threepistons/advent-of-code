require 'expect'

class Intcode

  attr_reader :result
  attr_accessor :input
  attr_reader :output

  def initialize
    @result = ''
    @input  = 0
    @output = 'cat'
    thearray = []
  end

# this didn't work for reasons I have yet to work out
  def calculate(program)
    operator = ''
    a = 0
    b = 0
    thearray = program.split(",").map { |s| s.to_i }
    thearray.each_with_index do | val, key |
      case key.divmod(4)[1]
      when 0
        case val
        when 1
          operator = 'add'
        when 2
          operator = 'multiply'
        when 99
          break
        else
          @result = "program input invalid"
          break
        end
      when 1
        a = thearray.at(val)
        #puts "A is #{a}"
      when 2
        b = thearray.at(val)
        #puts "B is #{b}"
      else
        case operator
        when 'add'
          thearray[val] = a + b
        else
          thearray[val] = a * b
        end
      end
    end
    @result = thearray.join(",")
  end

# this did work
  def loopcalculate(program)
    thearray = program.split(",").map { |s| s.to_i }
    self.reusedbit(thearray)
    @result = thearray.join(",")
    #puts @result
  end

  def reusedbit(thearray)
    i = 0
    lim = thearray.length
    while i < lim
      case thearray[i]
      when 1
        thearray[thearray[i+3]] = thearray.at(thearray[i+1]) + thearray.at(thearray[i+2])
        i+=4
      when 2
        thearray[thearray[i+3]] = thearray.at(thearray[i+1]) * thearray.at(thearray[i+2])
        i+=4
      when 3
        thearray[thearray[i+1]] = @input
        if lim < thearray[i+1]
          lim = thearray[i+1]
        end
        i+=2
      when 4
        @output = thearray.at(thearray[i+1]).to_s
        i+=2
      when 99
        break
      default
        puts "improperly-formed Intcode program"
        break
      end
    end
  end

  def bruteforce(program)
    noun = 0
    until noun == 100
      verb = 0
      until verb == 100
        thearray = program.split(",").map { |s| s.to_i } # for each iteration, we reset to "program"
        thearray[1] = noun
        thearray[2] = verb
        self.reusedbit(thearray)
        if thearray[0] == 19690720 then
          answer = verb + 100 * noun
          puts "Answer is #{answer}"
        end
        verb+=1
      end
      noun+=1
    end

  end

end

computer = Intcode.new
IO.foreach('input.txt') do |line|
  computer.loopcalculate(line)
  puts @result
  computer.bruteforce(line)
end
3
