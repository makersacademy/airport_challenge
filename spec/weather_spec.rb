require './lib/weather'

describe Weather do
  it "makes an instance of the Weather class" do
    weather = Weather.new
    expect(weather).to be_instance_of(Weather)
  end
end
