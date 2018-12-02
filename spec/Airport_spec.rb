require "Airport.rb"

describe Airport do

  let(:airport) { Airport.new(50) }
  let(:plane) { Plane.new }

  context '#land' do

    it 'responds to takeoff' do
      expect(airport).to respond_to(:takeoff)
    end

    it 'Plane no longer in the airport after takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include(plane)
    end

    it 'cannot land if the airport is full' do
      subject.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "#{plane} Cannot land"
    end

  end

  context 'stormy #weather' do
    let(:airport) { Airport.new(90) }
    it 'cannot take off if weather is stormy' do
      expect { airport.takeoff(plane) }.to raise_error("#{plane} Cannot take off")
    end
    it 'cannot land if weather is stormy' do
      expect { airport.land(plane) }.to raise_error("#{plane} Cannot land")
    end

  end
end
