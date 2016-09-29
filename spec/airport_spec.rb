require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'in clear weather' do

      # As an air traffic controller
      # So I can get passengers to a destination
      # I want to instruct a plane to land at an airport and confirm that it has landed

      it 'can instruct a plane to land and confirm it has landed' do
        weather_is_clear
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      # As an air traffic controller
      # So I can get passengers on the way to their destination
      # I want to instruct a plane to take off from an airport and confirm
      # that it is no longer in the airport.

      it 'instructs a plane to take-off, and confirms its no longer at the airport' do
        weather_is_clear
        airport.land(plane)
        airport.clear_for_take_off(plane)
        expect(airport.planes).not_to include plane
      end

      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when the airport is full

      it 'should not allow planes to land when full' do
        weather_is_clear
        airport = Airport.new(1)
        airport.land(plane)
        expect{airport.land(plane)}.to raise_error("Full")
      end

      # As the system designer
      # So that the software can be used for many different airports
      # I would like a default airport capacity that can be
      # overridden as appropriate

      it 'is possible to set the default capacity of an airport' do
        large_airport = Airport.new(50)
        expect(large_airport.capacity).to eq 50
      end

      # Planes can only take off from airports they are in.

      it 'only allows planes that have landed to take-off' do
        weather_is_clear
        plane2 = Plane.new
        expect{airport.clear_for_take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
      end

      # Planes that are already flying cannot takes off and/or be in an airport.

      it 'does not allow planes that are already flying to take-off' do
        weather_is_clear
        plane2 = Plane.new
        subject.land(plane2)
        subject.clear_for_take_off(plane2)
        expect{subject.clear_for_take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
      end

      # Planes that are landed cannot land again and must be in an airport.

      it 'knows when a plane has taken-off' do
        weather_is_clear
        planeA = Plane.new
        planeB = Plane.new
        airport.land(planeA)
        airport.land(planeB)
        airport.clear_for_take_off(planeB)
        expect(airport.planes).not_to include (planeB)
        expect { airport.land(planeA) }.to raise_error "Error: that plane has already landed"
      end

  end

  context 'in bad weather' do

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy

    it 'should prevent a plane taking off in a storm' do
      weather_is_clear
      airport.land(plane)
      weather_is_stormy
      expect{ airport.clear_for_take_off(plane) }.to raise_error("Storm")
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy

    it 'planes should not be able to land in a storm' do
      weather_is_stormy
      expect{airport.land(plane)}.to raise_error("Storm")
    end
  end

end

def weather_is_stormy
  allow_any_instance_of(Airport).to receive(:stormy?).and_return(true)
end

def weather_is_clear
  allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
end
