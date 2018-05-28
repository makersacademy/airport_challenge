require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  it 'is expected to be stormy when random number is less than the stormy weather threshold' do
    weather = Weather.new(1)
    expect(weather.stormy?).to eq true
  end

  it 'is expected not to be stormy when random number is greater than stormy weather threshold' do
    weather = Weather.new(5)
    expect(weather.stormy?). to eq false
  end
end
