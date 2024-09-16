require 'weather'

describe Weather do

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end
  
  it 'returns true or false from the stormy?' do
    weather_today = []
    100.times do
      weather_today << subject.stormy?
    end
    expect(weather_today).to include(true) and expect(weather_today).to include(false)
  end
end
