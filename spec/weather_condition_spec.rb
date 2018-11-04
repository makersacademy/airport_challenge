require './lib/weather_condition'

describe Weather do
  let(:weather) { described_class.new }
  it { is_expected.to be_instance_of(Weather) }
  it { is_expected.to respond_to(:random_weather) }
  it { is_expected.to respond_to(:stormy?) }

  it 'return true when weather is stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(weather.stormy?).to eq true
  end

  it 'return false when weather is not stormy' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(weather.stormy?).to eq false
  end

  it 'needs to return stormy or sunny' do
    expect(weather.random_weather).to eq('sunny').or(eq('stormy'))
  end

end
