require 'weather'

describe Weather do

# Arrange
  it "must create a weather object, default is not stormy" do
    Weather.new
  end

  it "must return false if weather status is not stormy " do
    weather = Weather.new
    expect(weather.stormy?).to eq false
  end

  it "must return true if weather status is stormy " do
    weather = Weather.new("Stormy")
    expect(weather.stormy?).to eq true
  end

end
