require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:weather) { double :weather }

  describe 'Arrivals' do
    it 'confirms aircraft can land if there is no storm' do
      allow(weather).to receive(:stormy?).and_return false
      expect{ airport.authorise_land(plane) }.to_not raise_error
    end

    it 'denies aircraft can land if there is a storm' do
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.authorise_land(plane) }.to raise_error("Landing denied: Adverse weather")
    end

    it 'denies landing if airport is full' do
      @airport1 = Airport.new
      10.times { @airport1.land(Plane.new) }
      expect { @airport1.authorise_land(Plane.new) }.to raise_error("Landing denied: Airport full")
    end

    it 'confirms aircraft has landed' do
      allow(plane).to receive(:landed?).and_return true
    end
  end

  describe 'Departures' do
    it 'confirms aircraft can take off if there is no storm' do
    allow(weather).to receive(:stormy?).and_return false
      expect { airport.take_off(plane) }.to_not raise_error
    end

    it 'confirms aircraft cannot take off as there is a storm' do
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error("Take-off denied: Adverse weather")
    end

    it 'confirms aircraft has departed the airport' do
      airport.confirm_departed(plane)
      expect(plane).to be_taken_off
    end
  end
end
