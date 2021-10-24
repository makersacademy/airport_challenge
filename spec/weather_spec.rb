require 'weather'

describe WeatherStatus do
subject(:weather_status) { described_class.new}

describe '#stormy?' do
  it 'may not be stormy' do
    allow(Kernel).to receive(:rand).and_return 1
    expect(weather_status.stormy?).to be false
  end
  it 'may be stormy' do
    allow(Kernel).to receive(:rand).and_return 10
    expect(weather_status.stormy?).to be true
  end
end

end