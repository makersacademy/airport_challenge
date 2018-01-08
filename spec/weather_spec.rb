require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  it 'returns true when weather is stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect(weather.stormy?).to eq true
  end

end
