require 'airport'

describe Aiport do
  let(:plane) {double :plane, landed?: false}

  describe 'land' do

    it 'expects the plane to land into the airport' do
      subject.land(plane)
      expect(subject.list_planes).to include([plane])
    end

  describe 'takeoff' do

    it 'expects the plane to take off from the airport' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.list_planes).to eq([])
    end

  end



  end
end
