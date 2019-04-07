require 'airport'

describe Airport do

  describe '#land' do
    plane = 'plane'
    it 'lands plane at the airport' do
      expect(subject.land(plane)).to eq 'plane'
    end
  end

  describe '#takeoff' do
    plane = 'plane'

    it 'plane can take off from airport' do
      expect(subject.takeoff(plane)).to eq 'plane'
    end

    it 'prevents plane from taking off if weather is stormy' do
      expect { subject.takeoff(plane) }.to raise_error('Weather is too stormy to takeoff')
    end
  end
end
