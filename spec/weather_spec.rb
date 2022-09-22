require 'weather'

describe Weather do 
  it "should check weather.stormy? returns true or false" do
    weather = Weather.new
    expect(weather.stormy?).to eq(true).or eq(false)
  end
  it "should check weather is a number between 1 and 10" do
    expect(subject.weather).to be_between(1, 10)
  end
end
