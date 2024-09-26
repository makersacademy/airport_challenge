require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:stormy?) }

  it 'does weather return false if numbers are 7 or below?' do
    srand(12)
    # 'random' number will be 7
    expect(weather.stormy?).to eq false
  end

  it 'does weather return true if random number is 8 or above?' do
    srand(4)
    # 'random' number will be 8
    expect(weather.stormy?).to eq true
  end

end
