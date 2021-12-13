require '02'

RSpec.describe Trajectory, '#trajectory' do
  context 'with test data' do
    it 'calculates final position' do
      traj = Trajectory.new
      traj.calculate('test.txt')
      expect(traj.length).to eq 15
      expect(traj.depth).to eq 10
      expect(traj.product).to eq 150
    end
  end
end
