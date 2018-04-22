require 'weather_station'

describe WeatherStation do

  it 'should return "sunny" or "stormy" when asked to #report' do
    expect(subject.report).to eq('sunny').or(eq('stormy'))
  end

end
