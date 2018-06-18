require 'airport'

describe Airport do

  let(:airport) { $airport = Airport.new }
  let(:plane) { $plane = Plane.new }

  describe '#land(plane)' do

    before do
      allow(airport).to receive(:stormy?) { false }
    end

    it 'Confirms if plane landed successfully' do
      expect { airport.land(plane) }.to output("Plane landed successfully.\n").to_stdout
    end

    it 'Stores landed planes' do
      airport.land(plane)
      expect(airport.send(:planes)).to eq([plane])
    end

    it 'Returns an error if trying to land at full airport' do
      airport.send(:capacity).times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error('Cannot land: Airport at capacity.')
    end

    it 'Returns an error if trying to land when already at an airport' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error('Cannot land: already at airport.')
    end

    it 'Returns an error if trying to land in stormy weather' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error("Cannot land due to stormy weather.")
    end
  end

  describe '#takeoff(plane)' do

    before do
      allow(airport).to receive(:stormy?) { false }
    end

    it 'Confirms if plane took off successfully' do
      airport.land(plane)
      expect { airport.takeoff(plane) }.to output("Plane took off successfully.\n").to_stdout
    end

    it 'Removes planes from storage' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.send(:planes)).to eq([])
    end

    it 'Returns an error if trying to takeoff when not at the airport' do
      expect { airport.takeoff(plane) }.to raise_error('Cannot take off: not at airport.')
    end

    it 'Returns an error if trying to take off in stormy weather' do
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff(plane) }.to raise_error("Cannot take off due to stormy weather.")
    end
  end

  describe '#stormy?' do
    it 'Returns true or false' do
      expect(subject.send(:stormy?)).to eq(true).or eq(false)
    end
  end
end
