require 'weather'

describe Weather do

  subject(:weather) { Weather.new }
  let(:model_weather) { double :weather }

  it 'creates new weather object' do
    expect(Weather.new.is_a? Weather).to eq true
  end

  it { is_expected.to respond_to(:stormy?) }

  it { is_expected.to respond_to(:weather_status) }

  it 'expects weather_status to return either "stormy" or "sunny" at random' do
    allow(model_weather).to receive(:weather_status)
    weather.weather_status
    expect(["stormy","sunny"]).to include (weather.weather_status)
  end

  it 'expects stormy? to return `true` if `weather_status` is equal to `stormy`' do
    allow(model_weather).to receive(:weather_status).and_return("stormy")
    expect(weather.stormy?).to eq true
  end
  
end