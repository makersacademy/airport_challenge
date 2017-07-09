require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:weather) { double :weather }

  context 'arrivals in good weather' do
    before(:example) do
      allow(weather).to receive(:stormy?) { false }
    end

    it 'confirms aircraft can land' do
      expect{ airport.authorise_land(plane) }.to_not raise_error
    end

    it 'denies landing if airport is full' do
      @airport1 = Airport.new
      10.times { @airport1.authorise_land(Plane.new)}
      expect { @airport1.authorise_land(Plane.new) }.to raise_error("Landing denied: Airport full")
    end

    it '#confirm_departed' do
      allow(plane).to receive(:landed?) { true }
    end
  end

  context 'arrivals in stormy weather' do
    before(:example) do
      allow(weather).to receive(:stormy?) { true }
    end

    it 'denies landing' do
      expect { airport.authorise_land(plane) }.to raise_error("Landing denied: Adverse weather")
    end
  end

  context 'departures in good weather' do
    before(:example) do
      allow(weather).to receive(:stormy?) { false }
      airport.land(plane)
    end

    it 'confirms take-off' do
      expect { airport.take_off(plane) }.to_not raise_error
    end

    it 'denies take-off if plane already departed' do
      airport.take_off(plane)
      expect {airport.take_off(plane)}.to raise_error "Plane already departed"
    end

    it 'confirms aircraft has departed the airport' do
      airport.confirm_departed(plane)
      expect(plane).to be_taken_off
    end
  end

  context 'departures in stormy weather' do
    before(:example) do
      allow(weather).to receive(:stormy?) { true }
    end

    it 'denies take off' do
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error("Take-off denied: Adverse weather")
    end
  end

end
