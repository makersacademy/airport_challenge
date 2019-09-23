require 'airport'
require 'weather'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe 'initialization' do
      subject { Airport.new }
      let(:plane) { Plane.new }

      it 'creates an airport with a default capacity' do
        expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
      end

      it 'creates a full station with a specified max capacity' do
        airport = Airport.new(12)
        12.times { airport.land_plane(plane) }
        expect { airport.land_plane(plane) }.to raise_error(RuntimeError, 'Airport is full')
      end
    end

  describe '#land_plane' do
    it 'raises error if plane is already on ground and tries to land again' do
      subject { Airport.new }
      plane = Plane.new
      subject.land_plane(plane)
      expect { subject.land_plane plane}.to raise_error(RuntimeError, 'Plane is already on the ground')
    end
  end

  describe '#take_off' do
    it 'plane can take off from airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
    #  expect { subject.take_off}.to raise_error 'weather too bad to fly' if dangerous_weather? = true
    end
  end
end
