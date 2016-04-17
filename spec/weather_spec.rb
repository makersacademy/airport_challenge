require 'weather'

class WeatherTest
  include Weather
end

describe WeatherTest do
  subject(:weather) { described_class.new }

  it 'can generate a random forecast' do
    expect([:stormy, :fine]).to include(weather.random_outlook)
  end
  it 'can generate a storm' do
    allow(weather).to receive(:random_outlook) { :stormy }
    expect(weather).to be_stormy
  end
  it 'can generate clear skies' do
    allow(weather).to receive(:random_outlook) { :fine }
    expect(weather).not_to be_stormy
  end
end
