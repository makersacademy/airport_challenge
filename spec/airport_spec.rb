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
      # LEFT OFF HERE - NEED TO WRITE TEST TO STOP PLANES LANDING IN STORMY WEATHER
    end
  end

  describe 'Airport take off request' do
    before do
      allow(plane_true).to receive(:landing)
      allow(plane_true).to receive(:take_off)
      allow(weather).to receive(:storms?)
    end

    it 'requests a plane to take off from the airport' do
      airport.request_landing(plane_true, weather)
      expect(airport.request_takeoff(plane_true, weather)).to be plane_true
    end
  end
end
