require "weather"

describe Weather do

  it "is stormy" do
    allow(subject).to receive(:random_weather) { true }
  end

  it "is sunny" do
    allow(subject).to receive(:random_weather) {false}
  end

end
