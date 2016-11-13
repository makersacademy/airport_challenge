require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  it 'can be sunny' do
    allow(weather).to receive(:stormy?).and_return false
    expect(weather.stormy?).to be false
  end

  it 'can be stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect(weather.stormy?).to be true
  end

end
