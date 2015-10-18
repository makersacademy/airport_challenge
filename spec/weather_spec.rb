require 'weather'

describe Weather do
  include Weather
  describe "#stormy?" do
    it "defaults to randomised weather conditions and finds both stormy and non-stormy conditions" do
      @bad_weather = true
      @cloud_seeding = false
      arr = []
      20.times { arr << stormy? }
      expect(arr.none? { |element| element == false} && arr.none? { |element| element == true}).to eq false
    end
  end
  describe "#cloud_seeding" do
    it "makes it possible to rig the weather by cloud seeding" do
      cloud_seeding
      expect(stormy?).to eq true
    end
  end

  describe "#sunny_weather" do
    it "makes it possible to rig the weather by wishing for sun" do
      sunny_weather
      expect(stormy?).to eq false
    end
  end
end