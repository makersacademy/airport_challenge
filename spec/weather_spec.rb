require "weather"
describe Weather do
  it "can by stormy but is is mostly sunny" do
    weather = Weather.new
    expect(weather.stormy).to be false
  end
end
