require 'airport'

describe Airport do
  let(:plane_true) { double(:plane, status?: true) }
  let(:plane_false) { double(:plane, status?: false) }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:request_landing).with(1).argument }
  it { is_expected.to respond_to(:request_takeoff).with(1).argument }

  describe 'Airport landing request' do
    before do
      allow(plane_false).to receive(:landing)
    end

    it 'requests a plane to land at the airport' do
      request = airport.request_landing(plane_false)
      expect(airport.request_landing(plane_false)).to eq request
    end
  end

  describe 'Airport take off request' do
    before do
      allow(plane_true).to receive(:landing)
      allow(plane_true).to receive(:take_off)
    end

    it 'requests a plane to take off from the airport' do
      airport.request_landing(plane_true)
      expect(airport.request_takeoff(plane_true)).to be plane_true
    end
  end
end
