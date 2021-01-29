require 'airport' 
require 'plane'
require 'weather'

describe Airport do
  describe '#land' do
    it 'informs air traffic controller plane has landed' do
      weather = double()
      weather.stub(:report) { "sunny" }
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      expect(airport.land(plane, weather)).to eq "MAK942 successfully landed at Makers airport"
    end

    it 'lets a plane land at an airport and the controller can see that it has landed' do
      weather = double()
      weather.stub(:report) { "sunny" }
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      airport.land(plane, weather)
      expect(airport.planes).to eq ['MAK942']
    end

    it 'prevents a plane from landing when the airport is full' do
      weather = double()
      weather.stub(:report) { "sunny" }
      airport = Airport.new('Python airport')
      plane1 = Plane.new('MAK121')
      plane2 = Plane.new('CPP091')
      plane3 = Plane.new('RUB091')
      airport.land(plane1, weather)
      airport.land(plane2, weather)
      expect { airport.land(plane3, weather) }.to raise_error "Landing denied"
    end

  end

  describe '#take_off' do
    it 'informs air traffic controller that plane has taken off' do
      weather = double()
      weather.stub(:report) { "sunny" }
      plane = Plane.new('MAK121')
      airport = Airport.new('Ruby airport')
      airport.land(plane, weather)
      expect(airport.take_off(plane, weather)).to eq 'MAK121 successfully taken off from Ruby airport'
    end

    it 'the list of planes at airport should now reflect that planes have left the airport' do
      weather = double()
      weather.stub(:report) { "sunny" }
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1, weather)
      airport.land(plane2, weather)
      airport.take_off(plane1, weather)
      expect(airport.planes).to eq ['RUB091']
    end
  end

  describe '#confirm_status' do
    it 'should, upon request, inform controller when landed at airport' do
      weather = double()
      weather.stub(:report) { "sunny" }
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1, weather)
      airport.land(plane2, weather)
      expect(airport.confirm_status('CPP091')).to eq 'CPP091 is at Python airport'
    end
  
    it 'should, upon request, inform controller when in flight' do
      weather = double()
      weather.stub(:report) { "sunny" }
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1, weather)
      airport.land(plane2, weather)
      airport.take_off(plane1, weather)
      expect(airport.confirm_status('CPP091')).to eq 'CPP091 is in flight'
    end
  end

  describe '#capacity' do
    it 'the system designer should be able to override the default capacity for a new instance of Airport' do
      weather = double()
      weather.stub(:report) { "sunny" }
      devs_airport = Airport.new('Dev airport', 3)
      expect(devs_airport.capacity).to eq 3
    end

    it 'given the above, the correct amount of planes should be able to land' do
      weather = double()
      weather.stub(:report) { "sunny" }
      devs_airport = Airport.new('Dev airport', 3)
      plane1 = Plane.new('RUB091')
      plane2 = Plane.new('CPP091')
      plane3 = Plane.new('MAK121')
      devs_airport.land(plane1, weather)
      devs_airport.land(plane2, weather)
      expect(devs_airport.land(plane3, weather)).to eq 'MAK121 successfully landed at Dev airport'
    end

    it 'given an increased capacity, no more than the max capacity should be allowed to land' do
      weather = double()
      weather.stub(:report) { "sunny" }
      devs_airport = Airport.new('Dev airport', 3)
      plane1 = Plane.new('RUB091')
      plane2 = Plane.new('CPP091')
      plane3 = Plane.new('MAK121')
      plane4 = Plane.new('MAK942')
      devs_airport.land(plane1, weather)
      devs_airport.land(plane2, weather)
      devs_airport.land(plane3, weather)
      expect { devs_airport.land(plane4, weather) }.to raise_error 'Landing denied'
      expect(devs_airport.planes).to eq ['RUB091', 'CPP091', 'MAK121']
    end 
  end

  describe '#stormy?' do
    it 'denies clearance for landing if weather is stormy' do
      weather = double()
      weather.stub(:report) { "stormy" }
      airport = Airport.new('Makers airport')
      plane = Plane.new('MAK121')
      expect { airport.land(plane, weather) }.to raise_error 'Landing denied due to weather'
    end

    it 'also denies clearance for takeoff if weather is stormy' do
      weather = double()
      weather.stub(:report) { "sunny" }
      airport = Airport.new('Makers airport')
      plane = Plane.new('MAK121')
      airport.land(plane, weather)
      weather = double()
      weather.stub(:report) { "stormy" }
      expect { airport.take_off(plane, weather) }.to raise_error 'Take off denied due to weather'
    end
  end
end
