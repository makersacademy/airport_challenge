require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  plane1 = Plane.new
  plane2 = Plane.new

  describe '#land' do
    it 'allows a plane to land' do
      expect { airport.land double(:plane).to eq :plane }
    end
  end

  describe '#planes' do
    it 'shows planes in airport' do
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.planes).to eq [plane1, plane2]
    end
  end

  describe '#in_airport' do
    it 'checks if a plane has landed' do
      airport.land(plane1)
      expect(airport.in_airport?(plane1)).to be_truthy
      expect(airport.in_airport?(plane2)).to be_falsy
    end
  end

  describe '#takeoff' do
    it 'shows plane is no longer in airport after takeoff' do
      airport.planes = [plane1]
      airport.takeoff(plane1)
      expect(airport.in_airport?(plane1)).to be_falsy
    end

    it "cannot takeoff if it is stormy" do
      airport.planes = [plane1]
      airport.weather = "stormy"
      expect { airport.takeoff(plane1) }.to raise_error "cannot takeoff due to weather"
      expect(airport.in_airport?(plane1)).to be_truthy
    end

    it "can takeoff if it is sunny" do
      airport.planes = [plane1]
      airport.weather = "sunny"
      airport.takeoff(plane1)
      expect(airport.in_airport?(plane1)).to be_falsy
    end
  end

  describe '#full?' do
    it 'checks whether an airport is full' do
      airport.capacity.times { airport.land(Plane.new) }
      expect(airport.full?).to eq true
    end
  end

end
