require "weather"

describe Weather do
  it "#weather_report should return the weather" do
    expect(subject).to respond_to :weather_report
  end

  it "should sometimes be stormy" do
    weathers = []
    200.times { weathers << subject.weather_report }
    expect(weathers.include?(:good_weather)).to eq true
    expect(weathers.include?(:bad_weather)).to eq true
  end
end
