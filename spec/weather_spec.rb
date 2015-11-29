require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  it 'should be stormy when rand returns 1' do
    allow(weather).to receive(:rand) { 1 }
    expect(weather.stormy?).to eq true
  end

  it 'should NOT be stormy when rand returns 2 to 10' do
    allow(weather).to receive(:rand) { (2..10) }
    expect(weather.stormy?).to eq false
  end
end
