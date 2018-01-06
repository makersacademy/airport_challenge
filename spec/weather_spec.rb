require 'weather'

describe Weather do
  context "Check stormy?" do
    it "should be fine" do
      weather = Weather.new([:fine])
      expect(weather).not_to be_stormy
    end

    it "should be stormy" do
      weather = Weather.new([:stormy])
      expect(weather).to be_stormy
    end

  end
end
