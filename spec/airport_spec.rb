require 'airport'

describe Airport do

  let(:airport) { double :airport, land: [plane], planes: [plane] }
  let(:plane) { double :plane }
  describe '#land'

    it 'should instruct a plane to land and receive confirmation that it has landed' do
      expect(airport.land(plane)).to eq [plane]
    end

end
