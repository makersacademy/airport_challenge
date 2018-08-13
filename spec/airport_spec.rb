require 'airport'

describe Airport do
  let(:plane) { Plane.new("BA123") }

  context '#stormy weather' do
    let(:mockBadWeather) { double :weather, stormy?: true }
    let(:airportStormy) { Airport.new(30, mockBadWeather) }

    it 'error when plane cannot take off' do
      expect { airportStormy.plane_take_off(plane) }.to raise_error "Bad weather, plane cannot take off"
    end

    it 'error when plane cannot land' do
      expect { airportStormy.plane_land(plane) }.to raise_error "Bad weather, plane cannot land"
    end
  end
  
  let(:mockWeather) { double :weather, stormy?: false }
  let(:airport) { Airport.new(30, mockWeather) }
  
  context '#capacity' do 
    it 'when airport is full, plane cannot land' do
      allow(airport).to receive(:full?) { true }
      error = "Airport full, plane cannot land"
      expect { airport.plane_land(plane) }.to raise_error error
    end

    it 'allow airport capacity to be overwritten' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end

  context '#landing and taking off' do
    it 'when plane has landed returns plane has landed' do
      expect(airport.plane_land(plane)).to eq("#{plane.flight_no} has landed")
    end

    it 'when plane has left airport, returns plane has taken off' do
      airport.plane_land(plane)
      expect(airport.plane_take_off(plane)).to eq("#{plane.flight_no} has taken off")
    end

    it 'plane cannot take off if plane not in airport' do
      allow(plane).to receive(:at_airport) { false }
      expect { airport.plane_take_off(plane) }.to raise_error "Plane not at airport"
    end

    it 'plane cannot land if already in airport' do
      allow(plane).to receive(:at_airport) { true }
      expect { airport.plane_land(plane) }.to raise_error "Plane already at airport"
    end
  end

end
