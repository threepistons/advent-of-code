require '01'

RSpec.describe FuelMass, "#fuel" do
  context 'with module mass' do
    it 'gives the mass of fuel needed to launch one module' do
      mass = FuelMass.new
      mass.calculate(12)
      expect(mass.fuel).to eq 2
      mass.calculate(14)
      expect(mass.fuel).to eq 2
      mass.calculate(1969)
      expect(mass.fuel).to eq 654
      mass.calculate(100756)
      expect(mass.fuel).to eq 33583
    end
  end
end

RSpec.describe FuelCounterUpper, '#fuel' do
  context 'with module list' do
    it 'gives the mass of fuel needed to launch my spaceship' do
      mass = FuelCounterUpper.new
      mass.calculate('test.txt')
      expect(mass.fuel).to eq 658
    end
  end
end

RSpec.describe RecursiveFuelMass, "#fuel" do
  context 'with module mass' do
    it 'gives the mass of fuel needed to launch one module' do
      mass = RecursiveFuelMass.new
      mass.calculate(12)
      expect(mass.fuel).to eq 2
      mass.calculate(14)
      expect(mass.fuel).to eq 2
      mass.calculate(1969)
      expect(mass.fuel).to eq 966
      mass.calculate(100756)
      expect(mass.fuel).to eq 50346
    end
  end
end

RSpec.describe RecursiveFuelCounterUpper, '#fuel' do
  context 'with module list' do
    it 'gives the mass of fuel needed to launch my spaceship' do
      mass = RecursiveFuelCounterUpper.new
      mass.calculate('test.txt')
      expect(mass.fuel).to eq 970
    end
  end
end
