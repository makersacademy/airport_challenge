require 'airport'

describe Airport do

  describe '#land(plane)' do
    it 'Confirms if plane landed successfully' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      expect { airport.land(Plane.new) }.to output("Plane landed successfully.\n").to_stdout
    end

    it 'Stores landed planes' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end

    it 'Returns an error if trying to land in stormy weather' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(Plane.new) }.to raise_error("Cannot land due to stormy weather.")
    end

    it 'Returns an error if trying to land at full airport' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error('Cannot land: Airport at capacity.')
    end

    it 'Returns an error if trying to land when already at an airport' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error('Cannot land: already at airport.')
    end
  end

  describe '#takeoff(plane)' do
    it 'Confirms if plane took off successfully' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.takeoff(plane) }.to output("Plane took off successfully.\n").to_stdout
    end

    it 'Removes planes from storage' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).to eq([])
    end

    it 'Returns an error if trying to take off in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff(plane) }.to raise_error("Cannot take off due to stormy weather.")
    end

    it 'Returns an error if trying to takeoff when not at the airport' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      expect { airport.takeoff(plane) }.to raise_error('Cannot take off: not at airport.')
    end
  end
end
