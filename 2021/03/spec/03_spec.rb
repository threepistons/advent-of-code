require '03'

RSpec.describe Power, '#power' do
  context 'with test data' do
    it 'calculates power consumption' do
      power = Power.new('test.txt')
      power.calculate
      expect(power.gamma).to eq 22
      expect(power.epsilon).to eq 9
      expect(power.product).to eq 198
      #traj.parttwo
      #expect(traj.length).to eq 15
      #expect(traj.depth).to eq 60
      #expect(traj.product).to eq 900
    end
  end
end
