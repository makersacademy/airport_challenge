require 'airport'

describe Airport do
  let(:plane_true) { double(:plane, status?: true) }
  let(:plane_false) { double(:plane, status?: false) }
  let(:weather) { double(:weather) }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:request_landing).with(2).argument }
  it { is_expected.to respond_to(:request_takeoff).with(2).argument }

  describe 'Airport landing request' do
    before do
      allow(plane_false).to receive(:landing)
      allow(weather).to receive(:storms?)
    end

    it 'requests a plane to land at the airport' do
      request = airport.request_landing(plane_false, weather)
      expect(airport.request_landing(plane_false, weather)).to eq request
    end

    it 'rejects a landing plane if the weather is stormy' do
      allow(weather).to receive(:storms?).and_return true
      expect { airport.request_landing(plane_false, weather) }.to raise_error 'ERROR: it is too stormy to land'
    end

    it 'allows a plane to land after the storm has passed' do
      allow(weather).to receive(:storms?).and_return false
      expect { airport.request_landing(plane_false, weather) }.not_to raise_error
    end
  end

  describe 'Airport take off request' do
    before do
      allow(plane_true).to receive(:landing)
      allow(plane_true).to receive(:take_off)
      allow(plane_false).to receive(:landing)
      allow(weather).to receive(:storms?)
    end

    it 'requests a plane to take off from the airport' do
      airport.request_landing(plane_true, weather)
      expect(airport.request_takeoff(plane_true, weather)).to be plane_true
    end

    it 'rejects a taking off plane if the weather is stormy' do
      allow(weather).to receive(:storms?).and_return true
      expect { airport.request_takeoff(plane_false, weather) }.to raise_error 'ERROR: it is too stormy to take off'
    end

    it 'allows a plane to take off after the storm has passed' do
      allow(weather).to receive(:storms?).and_return false
      expect { airport.request_takeoff(plane_true, weather) }.not_to raise_error
    end

    it 'rejects a plane if the airport is full' do
      error = 'ERROR: the airport is full'
      airport.capacity.times { airport.request_landing(plane_false, weather) }
      expect { airport.request_landing(plane_false, weather) }.to raise_error error
    end
  end
end
