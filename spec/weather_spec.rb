require 'weather'


describe Weather do
  weather = Weather.new

  it "it's sunny" do
    allow(subject).to receive(:weather_check) { "sunny" }
    expect(subject.weather_check).to eq "sunny"
  end

  it "it's stormy" do
    allow(subject).to receive(:weather_check) { "stormy" }
    expect(subject.weather_check).to eq "stormy"
  end
end
