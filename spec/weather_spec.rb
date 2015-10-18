require 'weather'

describe Weather do
  include Weather
  describe "#stormy?" do
    it "defaults to randomised weather conditions and finds both stormy and non-stormy conditions" do
      arr = []
      20.times { arr << stormy? }
      expect(arr.none? { |element| element == false} && arr.none? { |element| element == true}).to eq false
    end
  end
  describe "#cloud_seeding" do
    it "is possible to rig the weather by cloud seeding" do
      cloud_seeding
      expect(stormy?).to eq true
    end
  end
end