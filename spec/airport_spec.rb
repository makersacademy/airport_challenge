require 'airport'
describe Airport do
  let(:weather) { double :weather }
  subject { described_class.new(weather) }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :landing_clear? }
  it { is_expected.to respond_to :takeoff_clear? }

  it 'prevents takeoff if the weather is stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect { subject.takeoff_clear? }.to raise_error 'Negative. Cancel take-off because of the weather.'
  end
end
