require 'plane'

describe Plane do
  # default values shown for clairty.
  let(:plane) { Plane.new('concord', 'air') }
  let(:airport) { Airport.new('heathrow', [], 1) }

  it 'responds to land' do
    is_expected.to respond_to :land
  end

  describe 'land' do
    it 'instructs a plane to land at an airport' do
      plane.land(airport)
      expect(airport.hangar[0]).to be_kind_of(Plane)
    end

    it 'sets the location of a plane to the airport' do
      plane.land(airport)
      expect(plane.location).to be_kind_of(Airport)
    end

    # guard conditions

    it 'fails to land a plane if it is already landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error('plane already landed')
    end

    it 'fails to land a plane if the weather is stormy' do
      allow(plane).to receive(:stormy?).and_return(true)
      expect { plane.land(airport) }.to raise_error('weather is stormy')
    end

    it 'fails if a default capacity hangar is at capacity' do
      airport.capacity.times { airport.hangar << Plane.new }
      expect { plane.land(airport) }.to raise_error('hangar at capacity')
    end

    it 'fails if custom set capacity hangar is reached' do
      large_airport = Airport.new('large', [], 20)
      large_airport.capacity.times { large_airport.hangar << Plane.new }
      expect { plane.land(large_airport) }.to raise_error('hangar at capacity')
    end
  end

  describe 'take_off' do
    it 'instructs a plane to take off from an airport and confirms no longer in the airport' do
      plane.location = airport
      plane.take_off
      expect(plane.location).to eq('air')
    end

    it 'fails if the weather is stormy' do
      allow(plane).to receive(:stormy?).and_return(true)
      expect { plane.take_off }.to raise_error('weather is stormy')
    end

    it 'fails if plane is already in the air' do
      # planes by default are in the air, if not defined otherwise
      expect { plane.take_off }.to raise_error('already in the air')
    end
  end

  describe 'stormy?' do
    it 'returns true if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end
  end

end
