require './docs/weather.rb'

describe Weather do
  context "When testing the Weather class" do

    it "The stormy? method should return true if called" do
      weather = Weather.new
      stormy = weather.stormy?
      expect(stormy).to eq true
    end
    it "The sunny? method should return true if called" do
      weather = Weather.new
      sunny = weather.sunny?
      expect(sunny).to eq true 
    end
  end
end
