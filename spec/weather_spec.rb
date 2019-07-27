require 'weather'

describe Weather do

  it { is_expected.to respond_to :stormy? }

  describe "#stormy?" do
    it "should return true roughly 20% of the time by default" do
      weather_tests = []
      1000.times { weather_tests << subject.stormy? }
      expect(weather_tests.count(true)).to be_within(50).of(200)
    end
  end
end