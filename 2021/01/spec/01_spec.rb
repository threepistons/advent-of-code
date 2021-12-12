require '01'

RSpec.describe DepthIncreases, "#depthincreases" do
  context 'with test data' do
    it 'counts the depth increases' do
      di = DepthIncreases.new
      di.calculate('test.txt')
      expect(di.total).to eq 7
    end
    it 'counts the sliding window increases' do
      di = DepthIncreases.new
      di.threes('test.txt')
      expect(di.total).to eq 5
    end
  end
end

