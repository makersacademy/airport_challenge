require 'airport'

describe Airport do

 plane = double('plane')

  describe '#land' do
    it 'lands plane at the airport' do
      expect(subject.land(plane)).to eq 'plane'
    end
  end

  describe '#takeoff' do
    it 'plane can take off from airport' do
      expect(subject.takeoff(plane)). to eq 'plane'
    end
  end

end
