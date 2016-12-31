require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  it "should respond to a method is_weather_bad?" do
    expect(weather).to respond_to (:bad_weather?)
  end

end
