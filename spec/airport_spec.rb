require 'airport'

describe Airport do

  describe '#land(plane)' do
    it 'Confirms if plane landed successfully' do
      airport = Airport.new('clear')
      expect { airport.land(Plane.new) }.to output("Plane landed successfully.\n").to_stdout
    end

    it 'Stores landed planes' do
      airport = Airport.new('clear')
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end

    it 'Returns an error if trying to land in stormy weather' do
      airport = Airport.new('stormy')
      expect { airport.land(Plane.new) }.to raise_error("Cannot land due to stormy weather.")
    end

    it 'Returns an error if trying to land at full airport' do
      airport = Airport.new('clear')
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error('Cannot land: Airport at capacity.')
    end
  end

  describe '#takeoff(plane)' do
    it 'Confirms if plane took off successfully' do
      airport = Airport.new('clear')
      plane = Plane.new
      airport.land(plane)
      expect { airport.takeoff(plane) }.to output("Plane took off successfully.\n").to_stdout
    end

    it 'Removes planes from storage' do
      airport = Airport.new('clear')
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).to eq([])
    end

    it 'Returns an error if trying to take off in stormy weather' do
      airport = Airport.new('clear')
      plane = Plane.new
      airport.land(plane)
      airport.weather = 'stormy'
      expect { airport.takeoff(plane) }.to raise_error("Cannot take off due to stormy weather.")
    end
  end
end

#   it 'Returns an error when tries to land at a full airport' do
#     weather = double("weather")
#     allow(weather).to receive(:condition).and_return('clear')
#     airport = Airport.new(weather)
#     10.times { Plane.new.land(airport) }
#     expect { Plane.new.land(airport) }.to raise_error('Airport full')
#   end
# end
