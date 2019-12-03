require '02'

RSpec.describe Intcode, "#1202" do
  context 'with supplied values' do
    it 'tests my Intcode computer' do
      ic = Intcode.new
      ic.loopcalculate('1,0,0,0,99')
      expect(ic.result).to eq '2,0,0,0,99'
      ic.loopcalculate('2,3,0,3,99')
      expect(ic.result).to eq '2,3,0,6,99'
      ic.loopcalculate('2,4,4,5,99,0')
      expect(ic.result).to eq '2,4,4,5,99,9801'
      ic.loopcalculate('1,1,1,4,99,5,6,0,99')
      expect(ic.result).to eq '30,1,1,4,2,5,6,0,99'
      ic.loopcalculate('1,1,1,4,99,5,6,0,99,7,3,0')
      expect(ic.result).to eq '30,1,1,4,2,5,6,0,99,7,3,0'
    end
  end
end
