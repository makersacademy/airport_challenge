require 'weather'
describe Weather do

  it "should print 'sunny' when weather score is 0" do
    weather = Weather.new(0)
    expect(weather.condition).to eq("sunny")
  end

  it "should print 'stormy' when weather score is 9" do
    weather = Weather.new(9)
    expect(weather.condition).to eq("stormy")
  end

  it "should print 'sunny' when weather score is 7" do
    weather = Weather.new(7)
    expect(weather.condition).to eq("sunny")
  end

end
