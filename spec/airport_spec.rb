require 'airport'
require 'plane'
require 'weather'

describe Airport do
  clear_airport = Airport.new(Airport::DEFAULT_CAPACITY, :clear)
  stormy_airport = Airport.new(Airport::DEFAULT_CAPACITY, :stormy)
  plane = Plane.new
  landed_plane = Plane.new(false)

  describe 'multiple flights' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    
    it 'allows a number of planes to land' do
      clear_airport.land(plane1)
      clear_airport.land(plane2)
      clear_airport.land(plane3)
      expect(clear_airport.hangar).to include(plane1).and include(plane2).and include(plane3)
    end

    it 'allows a number of planes to take off' do
      clear_airport.takeoff(plane1)
      clear_airport.takeoff(plane2)
      clear_airport.takeoff(plane3)
      expect(clear_airport.hangar).to be_empty
    end
  end  
  
  describe 'landing' do
    it 'keeps a record of planes that have landed' do
      clear_airport.land(plane)
      expect(clear_airport.hangar).to include(plane)
    end

    it 'raises error if a plane tries to land at a full airport' do
      full_airport = Airport.new(0)
      message = 'No clearance to land: Airport is full'
      expect { full_airport.land(plane) }.to raise_error message
    end

    it 'prevents landing when weather is stormy' do
      message = 'No clearance to land: Stormy weather'
      expect { stormy_airport.land(plane) }.to raise_error message
    end
  
    it 'raises error when grounded plane tries to land' do
      message = 'No clearance to land: Plane isn\'t in flight'
      expect { clear_airport.land(plane) }.to raise_error message
    end

    it 'prevents non-planes from landing' do
      string = "I am not a plane"
      allow(string).to receive(:flying?) { true }
      message = 'No clearance to land: Object is not a plane'
      expect { clear_airport.land(string) }.to raise_error message
    end
  end

  describe 'takeoff' do
    it 'prevents planes not present in hangar from taking off' do
      plane = Plane.new
      clear_airport.land(plane)
      clear_airport.takeoff(plane)
      message = 'No clearance for takeoff: Plane is not in hangar'
      expect { clear_airport.takeoff(plane) }.to raise_error message
    end

    it 'prevents takeoff when weather is stormy' do
      message = 'No clearance for takeoff: Stormy weather'
      expect { stormy_airport.takeoff(plane) }.to raise_error message
    end

    it 'prevents non-planes from taking off' do
      string = "I am not a plane"
      allow(string).to receive(:flying?) { false }
      message = 'No clearance for takeoff: Object is not a plane'
      expect { clear_airport.takeoff(string) }.to raise_error message
    end
  end
  
  describe 'hangar' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'removes plane that takes off from planes array' do
      plane = Plane.new
      clear_airport.land(plane)
      clear_airport.takeoff(plane)
      expect(clear_airport.hangar).to_not include(plane)
    end

    it 'allows default capacity to be overridden' do
      big_airport = Airport.new(100)
      expect { big_airport.size != Airport::DEFAULT_CAPACITY }
    end

    it 'raises error if a plane has failed to leave the hangar' do
      plane = Plane.new
      clear_airport.land(plane)
      message = 'Alert: Plane has not taken off'
      expect { clear_airport.confirm_takeoff(plane) }.to raise_error message
    end

    it 'prints message to confirm plane has left hangar' do
      plane = Plane.new
      clear_airport.land(plane)
      clear_airport.takeoff(plane)
      message = 'Plane has successfully taken off'
      expect { clear_airport.confirm_takeoff(plane) }.to output(message).to_stdout
    end
  end
end
