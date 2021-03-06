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

    end

    it 'fails if the hangar is at capacity' do
      airport.hangar << Plane.new
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
  end
end
