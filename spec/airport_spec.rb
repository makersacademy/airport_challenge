require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the safe_to_land? method" do
    expect(subject).to respond_to :safe_to_land?
  end
  it "Shows that safe_to_land? returns true" do
    expect(subject.safe_to_land?).to eq true
  end
  it "Shows that safe_to_land will return true if the weather is sunny or false if it is stormy" do
    weather = double(:weather)
    allow(weather).to receive(:show_weather_condition).and_return ("sunny")
    expect(subject.safe_to_land?).to eq true
    allow(weather).to receive(:show_weather_condition).and_return ("stormy")
    expect(subject.safe_to_land?).to eq false
  end
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "returns a value when the show capacity method is called" do
    expect(subject.show_capacity).to eq @current_capacty
  end
end
