require 'expect'

class Circuit

  attr_reader :result

  def initialize
    @result = 0
  end

  def nearest(circuit)
    wires = []
    IO.foreach(circuit) do |line|
      wire = wirepath(line)
      #puts wire.empty?
      #puts wire
      wires.push(wire)
      #puts wires
    end
    crossings = wires[0] & wires[1]
    crossings.delete([0,0]) # remove origin
    #puts crossings
    distances = taxipaths(crossings)
    @result = distances.min
  end

  # conveniently, the array keys in wires[0] and wires[1] tell us how many steps along the wire we are.
  def shortest(circuit)
    wires = []
    trace = []
    IO.foreach(circuit) do |line|
      wire = wirepath(line)
      #puts wire.empty?
      #puts wire
      wires.push(wire)
      #puts wires
    end
    crossings = wires[0] & wires[1]
    crossings.delete([0,0]) # remove origin
    #puts crossings
    crossings.each do |crossing|
      lega = wires[0].index(crossing)
      legb = wires[1].index(crossing)
      trace.push(lega + legb)
    end
    @result = trace.min
  end

  def taxipaths(crossings)
    distances = []
    crossings.each do |crossing|
      len = crossing[0].abs + crossing[1].abs
      distances.push(len)
      #puts "#{crossing[0]},#{crossing[1]} = #{len}"
    end
    return distances
  end

  def wirepath(line)
    x = 0
    y = 0
    path = [[0,0]]
    vectors = line.split(",")
    vectors.each do |vector|
      case vector.chr
      when "U"
        lim = vector.delete_prefix("U").to_i
        i = 1
        while i <= lim do # if lim is 0 this loop should never run
          y += 1
          path.push([x,y])
          i += 1
        end
      when "D"
        lim = vector.delete_prefix("D").to_i
        i = 1
        while i <= lim do
          y -= 1
          path.push([x,y])
          i += 1
        end
      when "R"
        lim = vector.delete_prefix("R").to_i
        i = 1
        while i <= lim do
          x += 1
          path.push([x,y])
          i += 1
        end
      when "L"
        lim = vector.delete_prefix("L").to_i
        i = 1
        while i <= lim do
          x -= 1
          path.push([x,y])
          i += 1
        end
      end
    end
    return path
  end
end

circuit = Circuit.new
circuit.nearest('input.txt')
puts circuit.result

circuit.shortest('input.txt')
puts circuit.result
