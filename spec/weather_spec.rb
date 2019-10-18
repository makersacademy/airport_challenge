require "weather"

describe Weather do
  let(:subject) { Weather.new }

  it "is a instance of weather" do
    expect(subject).to be_instance_of(Weather)
  end

  it "has an array of weather types" do
    expect(subject.weather).to include("sun", "rain", "snow", "fog", "storm")
  end
  it "returns one type of weather" do
    expect(subject.weather_generator).not_to eq(subject.weather_generator)
  end
end
