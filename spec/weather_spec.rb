require "weather"

describe Weather do
  let(:subject) { Weather.new }

  it "is a instance of weather" do
    expect(subject).to be_instance_of(Weather)
  end

  it "has an array of weather types" do
    expect(subject.weather).to include("sun", "rain", "snow", "fog")
  end
  it "returns one type of weather" do
    test_Weather = weather_generator
    expect(subject.test_weather).not_to eq(subject.weather_generator)
  end
end
