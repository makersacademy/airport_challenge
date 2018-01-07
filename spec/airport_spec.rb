require 'airport'
# require 'weather'

describe Airport do

  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }


  describe '#land' do
    it 'lands plane' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'stores plane when it lands' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'stores more than one plane that lands' do
      plane2 = Plane.new
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq([plane, plane2])
    end

    it 'cannot land if already landed' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "Plane has already landed"
    end

  end

  describe '#take_off' do

    it 'takes off plane' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq []
    end

    it 'cannot take off if airborne' do
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane has already taken off"
    end

    it 'does not take off if weather is stormy' do
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Stormy weather"
    end
  end

end
