require '03'

RSpec.describe Circuit, "#taxidistance" do
  context 'with supplied values' do
    it 'finds where my wires are crossed' do
      ic = Circuit.new
      ic.wirepath('R8,U5,L5,D3')
      ic.nearest('6.txt')
      expect(ic.result).to eq 6
      ic.nearest('159.txt')
      expect(ic.result).to eq 159
      ic.nearest('135.txt')
      expect(ic.result).to eq 135
    end
  end
end
