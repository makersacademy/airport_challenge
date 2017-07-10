require 'airport'

describe Airport do
  let(:plane_true) { double(:plane, status?: true) }
  let(:plane_false) { double(:plane, status?: false) }
  let(:weather) { double(:weather) }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:request_landing).with(2).argument }
  it { is_expected.to respond_to(:request_takeoff).with(2).argument }

  describe 'New Airport' do

    it 'should have a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should allow the user to input a capacity for the airport' do
      new_airport = described_class.new 50
      expect(new_airport.capacity).to eq 50
    end

    it 'should allow a user to input their own capacity' do
      new_airport = described_class.new 100
      expect(new_airport.capacity).to eq 100
    end
  end

  describe 'Airport landing' do
    before do
      allow(plane_true).to receive(:landing)
      allow(plane_false).to receive(:landing)
      allow(weather).to receive(:storms?)
    end

    it 'requests a plane to land at the airport' do
      request = airport.request_landing(plane_false, weather)
      expect(airport.request_landing(plane_false, weather)).to eq request
    end

    it 'rejects a plane when it attempts to land twice' do
      error = 'ERROR: plane has already landed'
      expect { airport.request_landing(plane_true, weather) }.to raise_error error
    end

    it 'rejects a landing plane if the weather is stormy' do
      error = 'ERROR: it is too stormy to land'
      allow(weather).to receive(:storms?).and_return true
      expect { airport.request_landing(plane_false, weather) }.to raise_error error
    end

    it 'allows a plane can land after storm has cleared' do
      allow(weather).to receive(:storms?).and_return false
      expect { airport.request_landing(plane_false, weather) }.not_to raise_error
    end

    it 'rejects a plane if the airport is full' do
      error = 'ERROR: the airport is full'
      airport.capacity.times { airport.request_landing(plane_false, weather) }
      expect { airport.request_landing(plane_false, weather) }.to raise_error error
    end
  end

  describe 'Airport take off' do
    before do
      allow(plane_true).to receive(:landing)
      allow(plane_false).to receive(:landing)
      allow(plane_false).to receive(:take_off)
      allow(plane_true).to receive(:take_off)
      allow(weather).to receive(:storms?)
    end

    it 'requests a plane to take off from the airport' do
      request = airport.request_takeoff(plane_true, weather)
      expect(airport.request_takeoff(plane_true, weather)).to eq request
    end

    it 'rejects a plane that tries to take off twice' do
      error = 'ERROR: plane has already taken off'
      expect { airport.request_takeoff(plane_false, weather) }.to raise_error error
    end

    it 'rejects a taking off plane if the weather is stormy' do
      error = 'ERROR: it is too stormy to take off'
      allow(weather).to receive(:storms?).and_return true
      expect { airport.request_takeoff(plane_false, weather) }.to raise_error error
    end

    it 'allows a plane to take off after the storm has passed' do
      allow(weather).to receive(:storms?).and_return false
      expect { airport.request_takeoff(plane_true, weather) }.not_to raise_error
    end
  end
end
