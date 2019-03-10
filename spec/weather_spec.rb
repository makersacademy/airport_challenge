require 'weather'

describe Weather do

  it 'creates new weather object' do
    expect(Weather.new.is_a? Weather).to eq true
  end

  it { is_expected.to respond_to(:stormy?) }

  it { is_expected.to respond_to(:weather_status) }

  it 'expects weather_status to return either "stormy" or "sunny" at random' do
    weather = Weather.new
    expect(["stormy","sunny"]).to include(weather.weather_status)
  end
  
end