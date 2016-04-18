require 'weather'

describe Weather do

  describe "#initialize" do
    it "creates a random weather condition" do
      weather = double("weather", :condition => 88)
      expect(weather.condition).to eq(88)
    end

    it "expects condition to be set"
      expect(subject.condition).to eq(condition)
  end

end
