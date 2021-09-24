require 'airport'
require 'aeroplane'

describe Airport do
  let(:plane1) { double :plane1 }
  let(:plane2) { double :plane2 }
  describe '#land_plane' do
    it 'instructs a plane to land' do
      expect(subject.land_plane(plane1)).to eq(:ok)
    end

    it 'stops a plane landing when airport is full' do
      airport = Airport.new(1)
      airport.land_plane(plane1)
      expect { airport.land_plane(plane2) }.to raise_error("Airport is full")
    end
  end

  describe 'take_off' do
    it 'instruct a plane to take off' do
      expect(subject.take_off(plane1)).to eq(:ok)
    end
  end

end
