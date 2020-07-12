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
    let(:sunny_weather) { double("weather1", stormy?: false) }
    let(:airport1) { Airport.new(1, sunny_weather) }
    let(:plane1) { Plane.new }

    it 'tests that a plane is stored in airport upon landing' do
      expect(airport1.land(plane1.taken_off)).to eq airport1.planes
    end

    it 'tests an error is raised if a non flying plane tries to land at an airport' do
      expect { airport1.land(plane1.landed) }.to raise_error('Plane is not flying')
    end

    it 'tests an error is raised if a plane tries to land if the airport is at capacity' do
      airport1 = Airport.new(0, sunny_weather)
      expect { airport1.land(plane1.taken_off) }.to raise_error('Airport is at capacity')
    end

    it 'tests that an error is raised if a plane tries to land if weather is stormy?' do
      stormy_weather = double("bad_weather", stormy?: true)
      airport2 = Airport.new(1, stormy_weather)
      expect { airport2.land(plane1.taken_off) }.to raise_error('Weather conditions do not permit landing')
    end
  end

  describe '#take_off(plane)' do
    let(:sunny_weather) { double("sunny_weather", stormy?: false) }
    let(:airport1) { Airport.new(1, sunny_weather) }
    let(:plane1) { Plane.new }

    it 'tests that a plane leaves airport upon take_off' do
      airport1.land(plane1)
      airport1.take_off(plane1)
      expect(airport1.planes).not_to include(plane1)
    end

    it 'tests an error is raised if the take_off plane is not at the airport' do
      expect { airport1.take_off(plane1.landed) }.to raise_error('Plane is not at airport')
    end

    it 'tests an error is raised if plane tries to take_off while it is already flying' do
      expect { airport1.take_off(plane1.taken_off) }.to raise_error('Plane is flying')
    end

    it 'tests an error is raised if take_off attempted during stormy weather' do
      stormy_weather = double("bad_weather", stormy?: true)
      airport2 = Airport.new(1, stormy_weather)
      expect { airport2.take_off(plane1) }.to raise_error('Weather conditions do not permit take off')
    end
    
  end

  describe '#BONUS TEST' do
    it 'tests that multiple planes can be landed and then take_off' do
      sunny_weather = double("sunny_weather", stormy?: false)
      airport1 = Airport.new(5, sunny_weather)
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
