require 'airport'

describe Airport do

  subject(:airport) { Airport.new }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end

    it 'stores plane when it lands' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'stores more than one plane that lands' do
      plane = Plane.new
      plane2 = Plane.new
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq([plane, plane2])
    end

    it 'cannot land if already landed' do
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "Plane has already landed"
    end

  end

  describe '#take_off' do

    it 'takes off plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq []
    end

    it 'cannot take off if airborne' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane has already taken off"
    end

  end

end
