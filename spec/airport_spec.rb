require 'airport'

describe Airport do

  describe '#land' do
    it 'lands plane at the airport' do
      plane = 'plane'
      expect(subject.land(plane)).to eq 'plane'
    end
  end

  describe '#takeoff' do
    it 'plane can take off from airport' do
      plane ='plane'
      expect(subject.takeoff(plane)). to eq 'plane'
    end
  end

end
