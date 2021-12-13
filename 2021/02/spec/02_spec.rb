require '02'

RSpec.describe Trajectory, '#trajectory' do
  context 'with test data' do
    it 'calculates final position' do
      traj = Trajectory.new('test.txt')
      traj.calculate
      expect(traj.length).to eq 15
      expect(traj.depth).to eq 10
      expect(traj.product).to eq 150
      traj.parttwo
      expect(traj.length).to eq 15
      expect(traj.depth).to eq 60
      expect(traj.product).to eq 900
    end
  end
end
