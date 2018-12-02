require "Airport.rb"

describe Airport do

  let(:airport) { Airport.new(50) }
  let(:plane) { Plane.new }

  context '#land' do

    it 'responds to land' do
      expect(airport).to respond_to(:land)
    end

    it 'lands the plane in the airport' do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

  end

  context '#takeoff' do

    it 'responds to take off' do
      expect(airport).to respond_to(:takeoff)
    end

    it 'confrims the plane is no longer in the airport' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include(plane)
    end

  end

  context 'stormy #weather' do
    let(:airport) { Airport.new(90) }
    it 'cannot take off if weather is stormy' do
      expect { airport.takeoff(plane) }.to raise_error("#{plane} Cannot take off")
    end

  end
end
