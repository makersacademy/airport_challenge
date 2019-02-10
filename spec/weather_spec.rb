require 'weather'

describe Weather do

  it 'forecats the weather' do
    weather = double(Weather)
    weather.stub(:forecast).and_return("stormy")
    expect(weather.forecast).to eq "stormy"
  end

  it 'forecasts random weather' do
    weather = Weather.new
    expect(weather.forecast).to eq("stormy").or eq("sunny") 
  end

end
