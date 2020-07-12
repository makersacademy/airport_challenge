require_relative '../lib/airport.rb'

describe Airport do

  describe '#capacity' do

    it 'capacity has a default value if none provided' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'capacity can be set by user' do
      expect(Airport.new(20).capacity).to eq 20
    end
  end

  describe '#checks_for(plane)' do

    it 'tests whether a specific plane is at the airport' do
      expect(Airport.new.checks_for(Plane.new)).to eq false
    end
    it 'tests that true is returned if checked for plane is at the airport' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.taken_off
      airport1.land(plane1)
      expect(airport1.checks_for(plane1)).to eq true
    end
  end

  describe '#land(plane=Plane.new)' do

    it 'tests that a plane is stored in airport upon landing' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.taken_off
      expect(airport1.land(plane1)).to eq airport1.planes
    end

    it 'tests an error is raised if a non flying plane tries to land at an airport' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.landed
      expect { airport1.land(plane1) }.to raise_error('Plane is not flying')
    end

    it 'tests an error is raised if a plane tries to land if the airport is at capacity' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(0, weather1)
      plane1 = Plane.new.taken_off
      expect { airport1.land(plane1) }.to raise_error('Airport is at capacity')
    end

    it 'tests that an error is raised if a plane tries to land if weather is stormy?' do
      weather1 = double("weather1", stormy?: true)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.taken_off
      expect { airport1.land(plane1) }.to raise_error('Weather conditions do not permit landing')
    end
  end

  describe '#take_off(plane)' do

    it 'tests that a plane leaves airport upon take_off' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.taken_off
      airport1.land(plane1)
      airport1.take_off(plane1)
      expect(airport1.planes).not_to include(plane1)
    end

    it 'tests an error is raised if the take_off plane is not at the airport' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.landed
      expect { airport1.take_off(plane1) }.to raise_error('Plane is not at airport')
    end

    it 'tests an error is raised if take_off attempted during stormy weather' do
      weather1 = double("weather1", stormy?: true)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new
      expect { airport1.take_off(plane1) }.to raise_error('Weather conditions do not permit take off')
    end

    it 'tests an error is raised if plane tries to take_off while it is already flying' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(1, weather1)
      plane1 = Plane.new.taken_off
      expect { airport1.take_off(plane1) }.to raise_error('Plane is flying')
    end
  end

  describe '#BONUS TEST' do
    it 'tests that multiple planes can be landed and then take_off' do
      weather1 = double("weather1", stormy?: false)
      airport1 = Airport.new(5, weather1)
      a = Plane.new.taken_off
      b = Plane.new.taken_off
      c = Plane.new.taken_off
      d = Plane.new.taken_off
      e = Plane.new.taken_off
      expect(airport1.land(c).count).to eq 1
      expect(airport1.land(d).count).to eq 2
      expect(airport1.land(e).count).to eq 3
      expect(airport1.land(b).count).to eq 4
      expect(airport1.land(a).count).to eq 5
      expect(airport1.take_off(b)).to eq b
      expect(airport1.take_off(d)).to eq d
      expect { airport1.take_off(b) }.to raise_error('Plane is flying')
      expect(airport1.planes).not_to include(d)
    end
  end
end
