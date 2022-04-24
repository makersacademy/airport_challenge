require "weather"

describe Weather do
  it "can make a new instance of Weather class" do
    expect(Weather.new).to be_an_instance_of(Weather)
  end
end