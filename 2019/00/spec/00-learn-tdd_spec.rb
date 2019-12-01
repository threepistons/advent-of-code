require '00-learn-tdd'

RSpec.describe Bowling, "#score" do
  context 'with no strikes or spares' do
    it 'sums the pin count for each roll' do
      bowling = Bowling.new
      20.times { bowling.hit(4) }
      expect(bowling.score).to eq 80
    end
  end
end

RSpec.describe Trombone, '#length' do
  context 'assuming tenor' do
    it 'shows the length at a given slide position' do
      trombone = Trombone.new
      trombone.slide(1)
      expect(trombone.length).to eq 270
      trombone.slide(7)
      expect(trombone.length).to eq 381
    end
  end
end
