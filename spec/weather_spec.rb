# require dependant files
require 'weather'

describe Weather do
  # check that the Weather instance generates a number between 1 and 10
  it "generates a random number between 1 and 10" do
    expect(subject.random_number).to be_between(1,10)
  end

  # assign 5 as the random number check it returns 'Sunny'
  it "generates sunny weather if random number is 1-8" do
    weather = Weather.new
    weather.random_number = 5
    expect(weather.random_weather).to eq("Sunny")
  end

  # assign 10 as the random number check it returns 'Stormy'
  it "generates sunny weather if random number is 9/10" do
    weather = Weather.new
    weather.random_number = 10
    expect(weather.random_weather).to eq("Stormy")
  end
end
