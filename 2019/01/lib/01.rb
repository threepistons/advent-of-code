class FuelMass

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def calculate(vehicle)
    @fuel = (vehicle / 3) - 2
  end

end


class FuelCounterUpper

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def calculate(list)
    modfuel = FuelMass.new
    IO.foreach(list) do |amodule| # module is a keyword
      modfuel.calculate(amodule.to_i)
      @fuel += modfuel.fuel
    end
  end

end

class RecursiveFuelMass

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def calculate(vehicle)
    @fuel = 0
    tmp = (vehicle / 3) - 2
    while tmp > 0
      @fuel += tmp
      tmp = (tmp / 3) - 2
    end
  end

end

class RecursiveFuelCounterUpper

  attr_reader :fuel

  def initialize
    @fuel = 0
  end

  def calculate(list)
    modfuel = RecursiveFuelMass.new
    IO.foreach(list) do |amodule| # module is a keyword
      modfuel.calculate(amodule.to_i)
      @fuel += modfuel.fuel
    end
  end

end

mass = FuelCounterUpper.new
mass.calculate('input.txt')
puts mass.fuel

mass = RecursiveFuelCounterUpper.new
mass.calculate('input.txt')
puts mass.fuel
