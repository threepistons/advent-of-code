require '04'

RSpec.describe RudolphTheRipper do
  r = RudolphTheRipper.new
  context '"test" method' do
    it 'tests with 111111' do
      r.test('111111')
      expect(r.result).to eq true
    end
  end
  context '"test" method' do
    it 'tests with 122345' do
      r.test('122345')
      expect(r.result).to eq true
    end
  end
  context '"test" method' do
    it 'tests with 111123' do
      r.test('111123')
      expect(r.result).to eq true
    end
  end
  context '"test" method' do
    it 'tests with 135679' do
      r.test('135679')
      expect(r.result).to eq false
    end
  end
  context '"test" method' do
    it 'tests with 153677' do
      r.test('153677')
      expect(r.result).to eq false
    end
  end
  context '"test" method' do
    it 'tests with 022233' do
      r.test('022233')
      expect(r.result).to eq true
    end
  end
  context '"test" method' do
    it 'tests with 223450' do
      r.test('223450')
      expect(r.result).to eq false
    end
  end
  context '"test" method' do
    it 'tests with 123789' do
      r.test('123789')
      expect(r.result).to eq false
    end
  end
  context '"test" method' do
    it 'tests with 000000' do
      r.test('000000')
      expect(r.result).to eq true
    end
  end
  context '"counter" method' do
    it 'tests with 111110 to 111130' do
      r.counter('111110','111130')
      expect(r.count).to eq 17
    end
  end
end
