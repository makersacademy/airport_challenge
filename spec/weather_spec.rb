require 'weather'

describe Weather do

  describe "#initialize" do
    it "creates a weather condition" do
      weather = double("weather", :condition => 88)
      expect(weather.condition).to eq(88)
    end
  end

end
