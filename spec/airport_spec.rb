require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:airport) { described_class.new(capacity: 25, storm_probability: 0) }
  let(:stormy_airport) { described_class.new(storm_probability: 100) }

  describe '#initialize' do
    it 'can have its capacity overriden and planes can\'t land if full' do
      allow(plane).to receive(:land).and_return(plane)
      airport.capacity.times { airport.arrive(plane) }
      err = "Airport is full!"
      expect { airport.arrive(plane) }.to raise_error(RuntimeError, err)
    end
  end

  describe '#land' do
    it 'allows plane to land' do
      allow(plane).to receive(:land).and_return(plane)
      airport.arrive(plane)
      expect(airport.has_a?(plane)).to eq true
    end

    it 'doesn\'t allow plane to land in stormy weather' do
      err = "Plane can't land due to stormy weather."
      expect { stormy_airport.arrive(plane) }.to raise_error(RuntimeError, err)
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      allow(plane).to receive(:take_off).and_return(plane)
      allow(plane).to receive(:airport).and_return(nil)
      expect(airport.depart(plane).airport).to be_nil
    end

    it 'doesn\'t allow plane to take off in stormy weather' do
      err = "Plane can't take off due to stormy weather."
      expect { stormy_airport.depart(plane) }.to raise_error(RuntimeError, err)
    end
  end
end
