require 'weather'

describe Weather do

  it 'initializes with a weather constant' do
    expect(Weather::WEATHER).to eq [:sunny, :rainy, :stormy, :windy]
  end

  it 'randomly picks a weather' do
    expect(Weather::WEATHER).to include(subject.current_weather) 
  end

  it 'responds to stormy? method' do
    expect(subject).to respond_to :stormy?
  end

  it 'responds with true or false to stormy?' do
    expect(subject.stormy?).to match(true).or(false)
  end

end