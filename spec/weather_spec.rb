require 'weather'

describe Weather do

  describe "#initialize" do
    it "creates a random weather condition" do
      weather = instance_double("weather", :condition => 88)
      expect(weather.condition).to eq(88)
    end
  end
end
