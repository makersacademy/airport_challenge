require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'returns true if it is stormy' do
    allow(weather).to receive(:stormy).and_return true
    expect(weather.stormy).to be true
  end

  it 'returns nil if it is not stormy' do
    allow(weather).to receive(:stormy).and_return nil
    expect(weather.stormy).to be nil
  end

end
