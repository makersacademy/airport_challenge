require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:request_landing).with(1).argument }
  it { is_expected.to respond_to(:request_takeoff).with(1).argument }

  describe 'Airport landing request' do
    it 'requests a plane to land at the airport' do
      plane = double(:plane, status?: false)
      allow(plane).to receive(:landing)
      request = airport.request_landing(plane)
      expect(airport.request_landing(plane)).to eq request
    end
  end

  describe 'Airport take off request' do
    it 'requests a plane to take off from the airport' do
      plane = double(:plane, status?: true)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:landing)
      airport.request_landing(plane)
      expect(airport.request_takeoff(plane)).to be plane
    end
  end
end
