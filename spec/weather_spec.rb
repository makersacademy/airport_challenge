require "weather"

describe WeatherReport do
  it 'has an 80% chance of being :sunny' do
    srand(3) # rand = 0.550797
    expect(subject.weather).to eq :sunny
  end

  it 'has a 20% chance of being :stormy' do
    srand(4) # rand = 0.967029
    expect(subject.weather).to eq :stormy
  end
end
