require '03'

RSpec.describe Power, '#power' do
  context 'with test data' do
    it 'calculates power consumption' do
      power = Power.new('test.txt')
      power.calculate
      expect(power.gamma).to eq 22
      expect(power.epsilon).to eq 9
      expect(power.product).to eq 198
      power.parttwo
      expect(power.o2).to eq 23
      expect(power.co2).to eq 10
      expect(power.life).to eq 230
    end
  end
end
