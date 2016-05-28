require 'weather'

describe Weather do

  it "responds to weather report" do
    expect(subject).to respond_to :weather_report
  end

  it "returns different weather" do
    weather = Weather.new
    expect(subject.weather_report).to eq "The weather is currently: #{current_weather}"
  end

end
