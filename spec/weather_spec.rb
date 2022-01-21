# require dependant files
require 'weather'

describe Weather do
  # check that the Weather instance generates a number between 1 and 10
  it "generates a random number between 1 and 10" do
    expect(subject.random_number).to be_between(1,10)
  end

  # use stub to force 5 through to random_weather to check it returns 'Sunny'
  it "generates sunny weather if random number is 1-8" do
    weather = Weather.new
    weather.random_number = 5
    expect(weather.random_weather).to eq("Sunny")
  end
end