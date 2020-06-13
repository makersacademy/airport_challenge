require 'airport'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it 'has a default capacity' do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAP
  end

  describe '#land' do
    it 'lands a plane' do
      allow(@airport.weather).to receive(:stormy?) { false }
      @airport.land(@plane)
      expect(@airport.planes).to eq [@plane]
    end

    it 'raises error if airport is full' do
      allow(@airport.weather).to receive(:stormy?) { false }
      Airport::DEFAULT_CAP.times { @airport.land(@plane) }
      expect { @airport.land(@plane) }.to raise_error("Airport is full")
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      allow(@airport.weather).to receive(:stormy?) { false }
      @airport.land(@plane)
      @airport.take_off
      expect(@airport.planes).to eq []
    end

    it 'raises error if no planes in airport' do
      allow(@airport.weather).to receive(:stormy?) { false }
      expect { @airport.take_off }.to raise_error("No planes in airport")
    end
  end

  describe 'Raises error if stormy weather' do
    it 'does not land plane' do
      allow(@airport.weather).to receive(:stormy?) { true }
      expect { @airport.land(@plane) }.to raise_error("Weather is stormy, don't land!")
    end

    it 'does not let plane take off' do
      allow(@airport.weather).to receive(:stormy?) { true }
      expect { @airport.take_off }.to raise_error("Weather is stormy, don't take off!")
    end
  end
end
