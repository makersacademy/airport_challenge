require 'weather'

describe Weather do

  describe "#initialize" do
    let (:condition) { double :condition}

    it "expects condition to be set" do
      expect(condition).to eq(condition)
    end

    it "creates a random weather condition" do
      weather = double("weather", :condition => 88)
      expect(weather.condition).to eq(88)
    end
  end
end
