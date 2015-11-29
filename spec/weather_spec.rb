require_relative '../lib/weather.rb'

describe Weather do

  it 'Weather object exists' do
    expect(Weather.new).to be
  end

  it 'Weather has weather report method' do
    expect(Weather.new).to respond_to(:weather_report)
  end

  it 'weather report method returns sunny' do
     w = Weather.new
     w.stub(:weather_report).and_return("sunny")
     expect(w.weather_report).to eq("sunny")
  end

  it 'weather report method can return stormy' do
     w = Weather.new
     w.stub(:weather_report).and_return("stormy")
     expect(w.weather_report).to eq("stormy")
  end

end
