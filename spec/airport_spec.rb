require 'airport'

describe Airport do
  let(:plane) {double :plane, landed?: false}
  before{allow(plane).to receive(:is_landed).and_return(true)}

  describe 'land' do

    it 'expects the plane to land into the airport' do
      subject.land(plane)
      expect(subject.list_planes).to include(plane)
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
