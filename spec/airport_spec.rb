require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'lands the plane' do
      plane = Plane.new
      subject.land(plane)
      expect(airport.planes.pop).to eq plane
    end
    it 'raises error when there is no more space at the airport' do
      subject.land(Plane.new)
      expect { airport.land(Plane.new)}.to raise_error "The airport is full"
    end
  end

  describe '#plane' do
    it { is_expected.to respond_to(:planes) }
    it 'returns the landed plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes.pop).to eq plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'instruct a landed plane to take_off' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
    it 'raises an error if there are no planes' do
      expect{airport.take_off}.to raise_error "No planes at the airport"
    end
  end

end
