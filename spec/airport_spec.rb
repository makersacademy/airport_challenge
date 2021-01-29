require 'airport' 
require 'plane'

describe Airport do
  describe '#land' do
  
    it 'informs air traffic controller plane has landed' do
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      expect(airport.land(plane)).to eq "MAK942 successfully landed at Makers airport"
    end

    it 'lets a plane land at an airport and the controller can see that it has landed' do
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      airport.land(plane)
      expect(airport.planes).to eq ['MAK942']
    end

    it 'prevents a plane from landing when the airport is full' do
      airport = Airport.new('Python airport')
      plane1 = Plane.new('MAK121')
      plane2 = Plane.new('CPP091')
      plane3 = Plane.new('RUB091')
      airport.land(plane1)
      airport.land(plane2)
      expect{airport.land(plane3)}.to raise_error "Landing denied"
    end

  end

  describe '#take_off' do
    it 'informs air traffic controller that plane has taken off' do
      plane = Plane.new('MAK121')
      airport = Airport.new('Ruby airport')
      airport.land(plane)
      expect(airport.take_off(plane)).to eq 'MAK121 successfully taken off from Ruby airport'
    end

    it 'the list of planes at airport should now reflect that planes have left the airport' do
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1)
      airport.land(plane2)
      airport.take_off(plane1)
      expect(airport.planes).to eq ['RUB091']
    end
  end

  describe '#confirm_status' do
    it 'should, upon request, inform controller when landed at airport' do
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.confirm_status('CPP091')).to eq 'CPP091 is at Python airport'
    end
  
    it 'should, upon request, inform controller when in flight' do
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1)
      airport.land(plane2)
      airport.take_off(plane1)
      expect(airport.confirm_status('CPP091')).to eq 'CPP091 is in flight'
    end
  end

  describe '#capacity' do
    it 'the system designer should be able to override the default capacity for a new instance of Airport' do
      devs_airport = Airport.new('Dev airport', 3)
      expect(devs_airport.capacity).to eq 3
    end

    it 'given the above, the correct amount of planes should be able to land' do
      devs_airport = Airport.new('Dev airport', 3)
      plane1 = Plane.new('RUB091')
      plane2 = Plane.new('CPP091')
      plane3 = Plane.new('MAK121')
      devs_airport.land(plane1)
      devs_airport.land(plane2)
      expect(devs_airport.land(plane3)).to eq 'MAK121 successfully landed at Dev airport'
    end
  end
end
