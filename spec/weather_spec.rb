require 'weather'

describe Weather do

# Arrange
  it "must create a weather object" do
    weather = Weather.new
  end

  it "must return false if weather status is not stormy " do
    weather = Weather.new 
    expect(weather.stormy?).to eq false
  end

end

