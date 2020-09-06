require 'weather'

describe Weather do
  condition = Weather.new
  it "responds to the method crap_weather?" do
    expect(condition).to respond_to :crap_weather? 
  end
  it "returns true or false when crap_weather? is called" do
    expect(condition.crap_weather?).to eq(true).or eq(false)
  end
end