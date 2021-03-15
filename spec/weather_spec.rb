require 'spec_helper'
require 'weather'

describe Weather do

  it { is_expected.to respond_to(:weather)}

  it 'method weather - generates random weather' do
    # Arrange - create an array of the different weather
    random_weather_array = []
    100.times do |i|
      random_weather_array << subject.weather
    end
    # Act - check that it has stormy or sunny
    arr = random_weather_array.uniq
    # Assertion - check the array only contains instances of 'sunny' or 'stormy'
    expect(arr).to match_array ['stormy','sunny']
  end
  
end