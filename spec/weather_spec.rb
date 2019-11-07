require './lib/weather'

describe Weather do
  it "makes an instance of the Weather class" do
    weather = Weather.new
    expect(weather).to be_instance_of Weather
  end

  it "should usually be sunny but sometimes stormy" do
    expect(["stormy", "sunny"]).to include(subject.status)
  end

end
