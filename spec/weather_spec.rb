require 'weather'

describe Weather do
  it 'can respond to a method request of the state of weather' do
    expect(subject).to respond_to(:weather_forecast)
  end
end
