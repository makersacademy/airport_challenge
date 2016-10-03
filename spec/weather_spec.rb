require 'weather'

describe Weather do
  subject(:weather) {described_class.new}
  let(:stormy_weather) {double :stormy_weather, :stormy? => true }
  let(:sunny_weather) {double :sunny_weather, :stormy? => false }

  it {is_expected.to respond_to(:stormy?)}

  it 'returns true when the weather is stormy' do
    expect(stormy_weather.stormy?).to be true
  end

  it 'returns false when the weather is sunny' do
    expect(sunny_weather.stormy?).to be false
  end
end
