require 'weather'

class DummyWeatherChecker
end

describe 'Weather' do
  before :each do
    @weather_checker = DummyWeatherChecker.new
    @weather_checker.extend(Weather)
  end

  it "returns true when stormy" do
    allow(@weather_checker).to receive(:stormy?).and_return(true)
    expect(@weather_checker.stormy?).to eq true
  end

  it "returns false when not stormy" do
    allow(@weather_checker).to receive(:stormy?).and_return(false)
    expect(@weather_checker.stormy?).to eq false
  end
end
