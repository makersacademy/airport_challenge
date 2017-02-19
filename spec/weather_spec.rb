require 'spec_helper'
require 'weather'

class DummyWeatherChecker
end

describe 'Weather' do

  before :each do
    @weather_checker = DummyWeatherChecker.new
    @weather_checker.extend(Weather)
  end

  it "returns stormy weather when rand is greater than 0.7" do
    expect(@weather_checker.stormy?).to eq true
  end

end
