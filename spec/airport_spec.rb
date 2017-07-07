require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:request_landing).with(1).argument }
  it { is_expected.to respond_to(:request_takeoff) }

  describe 'Airport landing request' do
    it 'requests a plane to land at the airport' do
      plane = double(:plane, status?: false)
      planes = subject.request_landing(plane)
      expect(subject.request_landing(plane)).to eq planes
    end
  end

  describe 'Airport take off request' do
    it 'requests a plane to take off from the airport' do
      plane = double(:plane, status?: false)
      subject.request_landing(plane)
      expect(subject.request_takeoff).to be plane
    end
  end
end
