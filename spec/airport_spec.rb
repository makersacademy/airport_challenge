require 'airport'

describe Airport do

  let(:flying_plane){ double :flying_plane, flying?: :true, landed?: false }
  let(:landed_plane){ double :landed_plane, landed?: true, flying?: false }

  context 'when it is created' do 
    it 'has a traffic controller' do 
      expect(subject.traffic_controller).to be_a TrafficController
    end

    it 'has weather that is sunny' do 
      expect(subject.weather).to eq "Glorious sunshine"
    end

    it 'has a capacity of 5 planes' do 
      expect(subject.capacity).to be 5
    end
  end

  it 'can receive a plane' do 
    plane = Plane.new(subject)
    plane.pilot.request_to_land(subject)
    plane.pilot.land_plane(subject)

    expect(subject.planes.include?(plane)).to be true
  end

  it 'can be full' do 
    5.times do 
      plane = Plane.new(subject)
      plane.pilot.request_to_land(subject)
      plane.pilot.land_plane(subject)
    end

    expect(subject.full?).to be true
  end

  context 'after a plane has taken off' do 
    it 'there is one less plane in the airport' do 
      airport2 = Airport.new
      plane = Plane.new(subject)
      plane.pilot.request_to_land(subject)
      plane.pilot.land_plane(subject)

      first_count = subject.planes.count

      plane.pilot.request_to_take_off(airport2)
      plane.pilot.take_off(airport2)
      expect(subject.planes.count).to eq(first_count - 1)
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

end
