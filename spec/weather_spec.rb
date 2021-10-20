require_relative '../lib/weather'
describe Weather do
  before do

  end
  it 'should stormy report true' do
    allow(subject).to receive(:random_weather).and_return WEATHER_STATES[:stormy]
    expect(subject.stormy?).to eq(true)
  end
  it 'should stormy weather report false' do
    allow(subject).to receive(:random_weather).and_return WEATHER_STATES[:not_stormy]
    expect(subject.stormy?).to eq(false)
  end
end