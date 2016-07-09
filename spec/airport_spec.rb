require 'airport'

describe Airport do

  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }

  describe '#land: Landing single planes' do

    it 'can tell a plane to land' do
      expect(airport.land(plane)[0]).to eq plane
    end

    it 'knows if a plane has landed' do
      airport.land(plane)
      expect(airport.planes[0]).to eq plane
    end
  end

  describe '#land: Landing multiple planes' do

      it 'can tell many planes to land' do
        10.times{airport.land(plane)}
        expect(airport.planes.length).to eq 10
      end
    end

  describe '#take-off: works for single planes' do

    it 'can tell a plane to take-off' do
      expect(airport).to respond_to :take_off
    end

    it 'knows when a plane has taken-off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to eq plane
    end
  end

  describe '#take-off: works for multiple planes' do

    it 'knows when a plane has taken-off' do
      planeA = Plane.new
      planeB = Plane.new
      planeC = Plane.new
      airport.land(planeA)
      airport.land(planeB)
      airport.land(planeC)
      airport.take_off(planeA)
      expect(airport.planes).not_to include (planeA)
    end

  end

  describe 'edge-cases' do

    it 'only allows plane that has landed to take-off' do
      plane2 = Plane.new
      expect{airport.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
    end

    it 'does not allow planes that are already flying to take-off' do
      plane2 = Plane.new
      airport.land(plane2)
      airport.take_off(plane2)
      expect{airport.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
    end
  end


end
