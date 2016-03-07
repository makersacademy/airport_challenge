require 'airport'

describe 'features' do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:plane2) { Plane.new}

  context 'when landing a plane' do

    it 'changes status of a plane when it lands' do
      airport.land(plane)
      expect(plane.airborne).to eq false
    end

    it 'confirms that a plane has landed' do
      airport.land(plane)
      expect(plane.status).to eq "Landed"
    end

    it 'raises error if a landed plane tries to land' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "plane has already landed"
    end

  end

  context 'when a plane is taking off' do

    it 'changes status of a plane when it takes off' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.airborne).to eq true
    end

    it 'confirms that a plane has taken off' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.status).to eq "Airborne"
    end

    it 'raises an error if a plane tries to take off twice' do
      airport.land(plane)
      airport.land(plane2)
      airport.takeoff(plane)
      expect{airport.takeoff(plane)}.to raise_error "plane has already taken off"
    end

    it 'raises an error if a plane tries to take off from the wrong airport' do
      airport.land(plane)
      airport2 = Airport.new
      airport2.land(plane2)
      expect{airport.takeoff(plane2)}.to raise_error "plane is not at this airport"
    end

  end

end
