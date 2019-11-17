require 'weather'

describe Weather do
  describe "#stormy?" do
    it "should return either true or false" do
      expect(subject.stormy?).to eq(true).or eq(false)
    end

    it "shouldn't just return one type of weather all the time" do
      weather = Array.new(50) { subject.stormy? }
      expect(weather.uniq.size).to eq 2
    end
  end
end
