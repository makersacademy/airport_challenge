require 'weather'

describe Weather do
  it 'can respond to a method request of the state of weather' do
    expect(subject).to respond_to(:weather_forecast)
  end
  it 'outputs a weather report when forecast is called' do
    expect(subject.weather_forecast).to eq("Fine")
  end
end
