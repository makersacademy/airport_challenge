require 'airport'

describe Airport do
  let(:plane) { double('plane') }

  it { is_expected.to respond_to(:request_landing).with(1).arguments }
  it { is_expected.to respond_to(:request_take_off).with(1).arguments }

  context '#request_take_off' do
    it 'a plane cannot take off in bad weather' do
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:weather_status).and_return("Stormy")
      expect{ subject.request_take_off(plane) }.to raise_error
    end
  end
end
