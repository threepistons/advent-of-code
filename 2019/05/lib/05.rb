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
        puts "A is #{a}"
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
    # puts @result
  end

  def reusedbit(thearray)
    i = 0
    lim = thearray.length
    while i < lim
      puts 'current instruction', thearray[i]
      digits = thearray[i].digits # remember, 12345 becomes [5,4,3,2,1]
      puts 'The digits array', digits
      puts 'number of members', digits.length
      if digits.length > 1
        digits[1] = 10 * digits[1] + digits[0]
        digits.delete_at(0)
      end # digits should now be an array like [1] or [3,1,0,1] or [99,1], with digits[0] being the opcode and only mandatory element.
      de = digits[0]
      puts 'opcode', de
      # puts '---', digits # everything seems ok to here.
      if digits.length > 3 # then there must be a mode 1 instruction in digits[3]
        a = i+3
        puts 'mode immediate for third parameter', a
      else
        a = thearray[i+3]
        puts 'mode positional for third parameter', a
      end
      if digits.length > 2 && digits[2] == 1
        b = i+2
        puts 'mode immediate for second parameter', b
      else
        b = thearray[i+2]
        puts 'mode positional for second parameter', b
      end
      if digits.length > 1 && digits[1] == 1
        c = i+1
        puts 'mode immediate for first parameter', c
      else
        c = thearray[i+1]
        puts 'mode positional for first parameter', c
      end
      case de
      when 1
        thearray[a] = thearray.at(c) + thearray.at(b)
        i+=4
      when 2
        thearray[a] = thearray.at(c) * thearray.at(b)
        i+=4
      when 3
        thearray[c] = @input
        if lim < c
          lim = c
        end
        i+=2
      when 4
        @output = thearray.at(c).to_s
        i+=2
      when 5
        if thearray[c] != 0
          i = thearray.at(b)
        else
          i+=3
        end
      when 6
        if thearray[c] == 0
          i = thearray.at(b)
        else
          i+=3
        end
      when 7
        if thearray.at(c) < thearray.at(b)
          thearray[a] = 1
        else
          thearray[a] = 0
        end
        i+=4
      when 8
        if thearray.at(c) == thearray.at(b)
          thearray[a] = 1
        else
          thearray[a] = 0
        end
        i+=4
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
  computer.input = 5
  computer.loopcalculate(line)
  if computer.result != '0'
    puts 'ERROR:', computer.result
  end
  # computer.bruteforce(line)
  puts 'output is', computer.output
end
