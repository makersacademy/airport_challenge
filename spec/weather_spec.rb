require "weather"

describe Weather do
  let(:subject) { Weather.new }

  it "is a instance of weather" do
    expect(subject).to be_instance_of(Weather)
  end

  it "has an array of weather types" do
    expect(subject.weather_generator).to include("sun")
  end
end
