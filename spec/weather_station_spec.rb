require 'weather_station'

describe WeatherStation do

  it 'should respond to #report' do
    expect(subject).to respond_to(:report)
  end

end
