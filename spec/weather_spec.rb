require "weather"

describe Weather do

  it "should respond to the method forecast" do
    expect(subject). to respond_to :forecast
  end

  it "should tell return 1 if the weather is sunny" do
    weather = Weather.new
    check_weather = weather.forecast
    expect(subject.forecast).to eq(1) | eq(2)
  end






end
