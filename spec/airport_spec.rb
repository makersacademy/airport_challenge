require 'airport'

describe Airport do
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:request_landing).with(1).argument }

  describe 'Airport landing request' do
    it 'requests a plane to land at the airport' do
      plane = double(:plane, status?: false)
      planes = subject.request_landing(plane)
      expect(subject.request_landing(plane)).to eq planes
    end

    it 'rejects a plane that has already landed' do
      plane = double(:plane, status?: true)
      expect { subject.request_landing(plane) }.to raise_error 'Plane has already landed'
    end
  end
end
