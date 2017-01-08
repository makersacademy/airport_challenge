require './lib/weather.rb'

describe Weather do
  let(:weather) {Weather.new}
  it {is_expected.to respond_to :weather_generator}
  it {is_expected.to respond_to :randomizer}
  it 'generates true 25%' do
    allow(weather).to receive(:randomizer).and_return(80)
    expect(weather.weather_generator).to eq true
  end
  it 'generates false 75%' do
    allow(weather).to receive(:randomizer).and_return(60)
    expect(weather.weather_generator).to eq false
  end
end
