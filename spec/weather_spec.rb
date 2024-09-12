require 'spec_helper'
require 'weather'

describe Weather do

  it { is_expected.to respond_to(:weather)}

  it 'method weather - generates random weather' do
    random_weather_array = []
    100.times do |i|
      random_weather_array << subject.weather
    end
    arr = random_weather_array.uniq
    expect(arr).to match_array ['stormy','sunny']
  end
  
end