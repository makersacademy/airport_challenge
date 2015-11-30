require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { double :plane, landed: nil, touch_down: nil, in_flight: nil }
  before{allow(airport).to receive(:storm_forecast) {false}}

  describe 'airport capacity' do
    context 'when instantiated an airport' do
      it 'should have a default capacity' do
        expect(airport.capacity).to eq Airport::STANDARD_CAPACITY
      end

      it 'should be able to change the default capacity' do
        airport = described_class.new(40)
        expect(airport.capacity).to eq 40
      end
    end

    context 'when an airport expands it' do
      it 'should have a variable capacity' do
        airport.capacity = 20
        expect(airport.capacity).to eq 20
      end
    end

    context 'when capacity is reached it' do
      it 'should not let more planes land ' do
        Airport::STANDARD_CAPACITY.times {airport.land_plane(Plane.new)}
        expect{airport.land_plane(plane)}.to raise_error "The airport is full"
      end
    end
  end

  describe '#land_plane' do
    context 'when a plane lands it' do
      it 'should place that plane on the runway' do
        airport.land_plane(plane)
        expect(airport.runway.include?(plane)).to eq true
      end

      it 'should fail if the plane is already in airport' do
        plane1 = plane
        airport.land_plane(plane1)
        expect{airport.land_plane(plane1)}.to raise_error "Plane already landed"
      end
    end
  end

  describe '#take_off' do
    context 'when a plane takes off it' do
      it 'should remove plane from the runway' do
        airport.land_plane(plane)
        airport.take_off(plane)
        expect(airport.runway.include?(plane)).to eq false
      end

      it 'fail if that plane is not on the runway' do
        expect{airport.take_off(plane)}.to raise_error "Plane not in this airport"
      end
    end
  end

  describe 'stormy weather' do
    context 'when it is stormy' do
    before{allow(airport).to receive(:storm_forecast) {true}}
      it 'should not land planes' do
        expect{airport.land_plane(plane)}.to raise_error "Too stormy to land"
      end

      it 'should not allow planes to fly' do
        expect{airport.land_plane(plane)}.to raise_error "Too stormy to land"
      end
    end
  end
end
