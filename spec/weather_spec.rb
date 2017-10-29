require "weather"

describe Weather do

  let(:weather) { Weather.new }

  describe "initialize" do

    it "can be initiated" do
      expect(weather).to be_an_instance_of(Weather)
    end

    it "when initiated stores a weather variable with a float" do
      expect(weather.storm_chance).to be_kind_of(Float)
    end

  end

  describe "stormy?" do

    it "expects stormy to return true when storm_chance>0.9" do
      weather.instance_variable_set(:@storm_chance, 1)
      expect(weather.stormy?).to eq true
    end

    it "expects stormy to return false when storm_chance<0.9" do
      weather.instance_variable_set(:@storm_chance, 0.5)
      expect(weather.stormy?).to eq false
    end

  end

end
