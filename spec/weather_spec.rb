require 'weather'

describe Weather do

  it "can be created" do
    expect(subject).to be_a(Weather)
  end

  it "can report the weather" do
    expect(subject).to respond_to(:weather_report)
  end

  it "is randomly set to 'fine' or 'stormy'" do
    expect(1000.times.map { Weather.new.weather_report }).to include("fine", "stormy")
  end

end
