require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:airport) { Airport.new(:capacity => 25, :storm_probability => 0) }
  let(:stormy_airport) { Airport.new(:storm_probability => 100) }

  it 'can have its capacity overriden and planes can\'t land if full' do
    allow(plane).to receive(:land).and_return(plane)
    airport.capacity.times { airport.arrive(plane) }
    expect { airport.arrive(plane) }.to raise_error(
    RuntimeError,
    "Airport is full!")
  end

  describe '#land' do
    it 'allows plane to land' do
      allow(plane).to receive(:land).and_return(plane)
      expect(airport.arrive(plane)).to eq plane
    end

    it 'doesn\'t allow plane to land in stormy weather' do
      expect { stormy_airport.arrive(plane) }.to raise_error(
        RuntimeError,
        "Plane can't land due to stormy weather.")
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      allow(plane).to receive(:take_off).and_return(plane)
      allow(plane).to receive(:airport).and_return(nil)
      expect(airport.depart(plane).airport).to be_nil
    end

    it 'doesn\'t allow plane to take off in stormy weather' do
      expect { stormy_airport.depart(plane) }.to raise_error(
        RuntimeError,
        "Plane can't take off due to stormy weather.")
    end
  end
end
