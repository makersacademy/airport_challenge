require 'weather'

describe Weather do

# Arrange
  it "must create a weather object, default is not stormy" do
    weather = Weather.new
  end

  it "must be able to change the weather from story to not " do
    weather = Weather.new 
    expect(weather.set_stormy).to eq "Weather is stormy"
  end

  it "must return false if weather status is not stormy " do
    weather = Weather.new 
    expect(weather.stormy?).to eq false
  end

  it "must return true if weather status is stormy " do
    weather = Weather.new 
    weather.set_stormy
    expect(weather.stormy?).to eq true
  end

end

