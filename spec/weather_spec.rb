require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it {is_expected.to respond_to(:stormy?)}

  it 'returns true when the weather is stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(weather.stormy?).to be true
  end

  it 'returns false when the weather is sunny' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(weather.stormy?).to be false
  end
end
