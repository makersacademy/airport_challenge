require "weather"

describe Weather do
  let(:weather) { Weather.new }

  it "successfully instantiates the airport class" do
    expect(weather).to be_instance_of(Weather)
  end
end
