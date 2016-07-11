require "weather"

describe Weather do
  subject(:weather) {Weather.new}
  it "has a method that checks if stormy" do
    expect(weather).to respond_to(:stormy?)
  end
  it "has a chance to be stormy" do
    #stormy when < 3
    allow(weather).to receive(:prob).and_return(1)
    expect(weather.stormy?).to eq true
  end
end
