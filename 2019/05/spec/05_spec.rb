require '05'

RSpec.describe Intcode do
  ic = Intcode.new
  context 'with supplied values' do
    it '1,0,0,0,99' do
      ic.loopcalculate('1,0,0,0,99')
      expect(ic.result).to eq '2,0,0,0,99'
    end
    it '2,3,0,3,99' do
      ic.loopcalculate('2,3,0,3,99')
      expect(ic.result).to eq '2,3,0,6,99'
    end
    it '2,4,4,5,99,0' do
      ic.loopcalculate('2,4,4,5,99,0')
      expect(ic.result).to eq '2,4,4,5,99,9801'
    end
    it '1,1,1,4,99,5,6,0,99' do
      ic.loopcalculate('1,1,1,4,99,5,6,0,99')
      expect(ic.result).to eq '30,1,1,4,2,5,6,0,99'
    end
    it '1,1,1,4,99,5,6,0,99,7,3,0' do
      ic.loopcalculate('1,1,1,4,99,5,6,0,99,7,3,0')
      expect(ic.result).to eq '30,1,1,4,2,5,6,0,99,7,3,0'
    end
    it '3,0,4,0,99' do
      ic.input = '7'
      ic.loopcalculate('3,0,4,0,99')
      expect(ic.output).to eq '7'
    end
    # it '1002,4,3,4,33' do
    #   ic.loopcalculate('1002,4,3,4,33')
    #   expect(ic.result).to eq '1002,4,3,4,99'
    # end
    it '3,2;1' do
      ic.input = '1'
      ic.loopcalculate('3,2')
      expect(ic.result).to eq '3,2,1'
    end
    it '4,3,99,2' do
      ic.loopcalculate('4,3,99,2')
      expect(ic.output).to eq '2'
    end
  end
end
