require 'airport'

describe Aiport do

  let(:plane) {double :plane, landed?: false}

  describe 'land' do

    it 'expects the plane to land into the airport' do
      subject.land(plane)
      expect(subject.planes).to eq([plane])
    end

  end
end
