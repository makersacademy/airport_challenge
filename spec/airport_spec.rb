require 'airport'

describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:plane_take_off)
    end

    it 'releases a plane' do
      airport = Airport.new
      plane = Plane.new :destination
      airport.plane_land(plane)
      airport.plane_take_off
      expect(airport.planes.empty?).to eq true
    end
    it 'raises an error when no planes at the airport' do
      expect { subject.plane_take_off}.to raise_error 'Airport is empty'
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:plane_land)
    end

    it 'receives a plane' do
      airport = Airport.new
      plane = Plane.new :destination
      airport.plane_land(plane)
      expect(airport.planes.any?).to eq true
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new :destination
        subject.capacity.times { subject.plane_land(plane)}
        expect { subject.plane_land(plane)}.to raise_error 'Airport is full'
      end
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
